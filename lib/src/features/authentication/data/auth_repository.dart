import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:weather_assistant/src/features/authentication/data/firestore/user_firestore_repository.dart';
import 'package:weather_assistant/src/features/authentication/domain/app_user.dart';

class AuthRepository {
  Future<AppUser?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AppUser(
        id: userCredential.user!.uid,
        email: userCredential.user!.email,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<AppUser?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return AppUser(
        id: userCredential.user!.uid,
        email: userCredential.user!.email,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
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
