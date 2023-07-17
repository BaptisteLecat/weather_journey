import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/authentication/data/firestore/user_firestore_repository.dart';
import 'package:weather_assistant/src/features/authentication/domain/app_user.dart';

class SettingController extends StateNotifier<AsyncValue<void>> {
  SettingController({
    required this.authRepository,
    required this.userFirestoreRepository,
    required this.appUser,
  }) : super(const AsyncData(null));
  final AuthRepository authRepository;
  final AppUserFirestoreRepository userFirestoreRepository;
  AppUser appUser;

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }

  Future<void> selectStyle({required String styleId}) async {
    state = const AsyncLoading();
    if (appUser.styles != null && appUser.styles!.contains(styleId)) {
      var styles = appUser.styles!.toList();
      styles.remove(styleId);
      appUser = appUser.copyWith(styles: styles);
    } else if (appUser.styles != null) {
      var styles = appUser.styles!.toList();
      styles.add(styleId);
      appUser = appUser.copyWith(styles: styles);
    } else {
      appUser = appUser.copyWith(styles: [styleId]);
    }
    if (appUser.id == null) {
      throw Exception('AppUser id is null');
    }
    state = await AsyncValue.guard(() => userFirestoreRepository.updateStyle(
        docId: appUser.id!, stylesId: appUser.styles!));
  }

  Future<void> selectFrequency({required String frequencyId}) async {
    state = const AsyncLoading();
    if (appUser.frequencies != null &&
        appUser.frequencies!.contains(frequencyId)) {
      var frequencies = appUser.frequencies!.toList();
      frequencies.remove(frequencyId);
      appUser = appUser.copyWith(frequencies: frequencies);
    } else if (appUser.frequencies != null) {
      var frequencies = appUser.frequencies!.toList();
      frequencies.add(frequencyId);
      appUser = appUser.copyWith(frequencies: frequencies);
    } else {
      appUser = appUser.copyWith(frequencies: [frequencyId]);
    }
    if (appUser.id == null) {
      throw Exception('AppUser id is null');
    }
    state = await AsyncValue.guard(() =>
        userFirestoreRepository.updateFrequency(
            docId: appUser.id!, frequenciesId: appUser.frequencies!));
  }
}

final settingControllerProvider =
    StateNotifierProvider<SettingController, AsyncValue<void>>((ref) {
  AppUser? appUser = ref.read(appUserStreamProvider).value;
  if (appUser == null) {
    throw Exception('AppUser is null');
  }
  return SettingController(
      authRepository: ref.read(authRepositoryProvider),
      userFirestoreRepository: ref.read(userFirestoreRepositoryProvider),
      appUser: appUser);
});
