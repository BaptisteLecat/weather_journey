import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:weather_assistant/src/features/authentication/data/firestore/user_firestore_repository.dart';
import 'package:weather_assistant/src/features/authentication/domain/app_user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  static GoogleSignIn googleSignIn = GoogleSignIn();
  Future<AppUser?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return AppUser(
      id: userCredential.user!.uid,
      email: userCredential.user!.email,
    );
  }

  Future<AppUser?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return AppUser(
      id: userCredential.user!.uid,
      email: userCredential.user!.email,
    );
  }

  Future<User> signInWithApple({List<Scope> scopes = const []}) async {
    // 1. perform the sign-in request
    final result = await TheAppleSignIn.performRequests(
        [AppleIdRequest(requestedScopes: scopes)]);
    // 2. check the result
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken!),
          accessToken:
              String.fromCharCodes(appleIdCredential.authorizationCode!),
        );
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final firebaseUser = userCredential.user!;
        if (scopes.contains(Scope.fullName)) {
          final fullName = appleIdCredential.fullName;
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName} ${fullName.familyName}';
            await firebaseUser.updateDisplayName(displayName);
          }
        }
        return firebaseUser;
      case AuthorizationStatus.error:
        throw PlatformException(
          code: 'ERROR_AUTHORIZATION_DENIED',
          message: result.error.toString(),
        );

      case AuthorizationStatus.cancelled:
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      default:
        throw UnimplementedError();
    }
  }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          rethrow;
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          rethrow;
        }
      } catch (e) {
        // handle the error here
        throw Exception(e);
      }
    }

    return user;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// 2
final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

// 3
final appUserStreamProvider = StreamProvider<AppUser?>((ref) {
  final auth = ref.watch(authStateChangesProvider);

  if (auth.value != null) {
    final userFirestoreRepository = ref.watch(userFirestoreRepositoryProvider);
    return userFirestoreRepository
        .fetchOneWithStream(docId: auth.value!.uid)
        .map((user) => user.copyWith(
              firebaseAppUser: auth.value,
            ));
  } else {
    return Stream.value(null);
  }
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
