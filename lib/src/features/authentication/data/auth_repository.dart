import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
