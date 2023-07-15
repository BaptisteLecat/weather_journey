import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';

class SettingController extends StateNotifier<AsyncValue<void>> {
  SettingController({required this.authRepository})
      : super(const AsyncData(null));
  final AuthRepository authRepository;

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }
}

final settingControllerProvider =
    StateNotifierProvider<SettingController, AsyncValue<void>>(
  (ref) => SettingController(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);
