import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController({
    required this.authRepository,
  }) : super(const AsyncData(null));
  final AuthRepository authRepository;

  Future<void> signUpWithEmail(
      {required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository
        .signUpWithEmailAndPassword(email: email, password: password));
  }

  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository
        .signInWithEmailAndPassword(email: email, password: password));
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signInWithGoogle());
  }

  Future<void> signInWithApple(
      {List<Scope> scopes = const [Scope.email, Scope.fullName]}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signInWithApple(
          scopes: scopes,
        ));
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  return AuthController(
    authRepository: ref.read(authRepositoryProvider),
  );
});
