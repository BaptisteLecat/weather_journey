import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_assistant/src/features/authentication/domain/app_user.dart';

class AuthRepository {
  final Stream<User?> _authState = FirebaseAuth.instance.authStateChanges();

  Stream<AppUser?> authStateChanges() {
    return _authState
        .map((user) => user == null ? null : AppUser(uid: user.uid));
  }

  AppUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    return user == null ? null : AppUser(uid: user.uid, firebaseAppUser: user);
  }

  Future<AppUser?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AppUser(
        uid: userCredential.user!.uid,
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
        uid: userCredential.user!.uid,
        email: userCredential.user!.email,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository();
  return auth;
});
final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
