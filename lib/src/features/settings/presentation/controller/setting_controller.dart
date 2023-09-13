import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/authentication/data/firestore/user_firestore_repository.dart';
import 'package:weatherjourney/src/features/authentication/domain/app_user.dart';
import 'package:weatherjourney/src/features/settings/data/firestore/frequency_firestore_repository.dart';
import 'package:weatherjourney/src/features/settings/data/firestore/style_firestore_repository.dart';
import 'package:weatherjourney/src/features/settings/domain/frequency/frequency.dart';
import 'package:weatherjourney/src/features/settings/domain/style/style.dart';

class SettingController extends StateNotifier<AsyncValue<void>> {
  SettingController({
    required this.authRepository,
    required this.userFirestoreRepository,
    required this.styleFirestoreRepository,
    required this.frequencyFirestoreRepository,
    required this.appUser,
  }) : super(const AsyncData(null));
  final AuthRepository authRepository;
  final AppUserFirestoreRepository userFirestoreRepository;
  final StyleFirestoreRepository styleFirestoreRepository;
  final FrequencyFirestoreRepository frequencyFirestoreRepository;
  AppUser appUser;

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }

  Future<void> selectStyle({required String styleId}) async {
    state = const AsyncLoading();
    //Fetch the style we want to add from firestore.
    //We need to do this because the style we want to add is not complete.
    //We only have the id of the style.
    Style style = await styleFirestoreRepository.fetchOne(docId: styleId);

    if (appUser.styles != null &&
        appUser.styles!.map((e) => e.id).contains(styleId)) {
      var styles = appUser.styles!.toList();
      styles.remove(styles.firstWhere((element) => element.id == styleId));
      appUser = appUser.copyWith(styles: styles);
    } else if (appUser.styles != null) {
      var styles = appUser.styles!.toList();

      styles.add(style);
      appUser = appUser.copyWith(styles: styles);
    } else {
      appUser = appUser.copyWith(styles: [style]);
    }
    if (appUser.id == null) {
      throw Exception('AppUser id is null');
    }

    state = await AsyncValue.guard(() => userFirestoreRepository.updateStyle(
        docId: appUser.id!, styles: appUser.styles!));
  }

  Future<void> selectFrequency({required String frequencyId}) async {
    state = const AsyncLoading();

    //Fetch the frequency we want to add from firestore.
    //We need to do this because the frequency we want to add is not complete.
    //We only have the id of the frequency.
    Frequency frequency =
        await frequencyFirestoreRepository.fetchOne(docId: frequencyId);

    if (appUser.frequencies != null &&
        appUser.frequencies!.map((e) => e.id).contains(frequency.id)) {
      var frequencies = appUser.frequencies!.toList();
      frequencies.remove(
          frequencies.firstWhere((element) => element.id == frequency.id));
      appUser = appUser.copyWith(frequencies: frequencies);
    } else if (appUser.frequencies != null) {
      var frequencies = appUser.frequencies!.toList();
      frequencies.add(frequency);
      appUser = appUser.copyWith(frequencies: frequencies);
    } else {
      appUser = appUser.copyWith(frequencies: [frequency]);
    }
    if (appUser.id == null) {
      throw Exception('AppUser id is null');
    }

    print(appUser.frequencies?.map((e) => e.id).toList());

    state = await AsyncValue.guard(() =>
        userFirestoreRepository.updateFrequency(
            docId: appUser.id!, frequencies: appUser.frequencies!));
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
      styleFirestoreRepository: ref.read(styleFirestoreRepositoryProvider),
      frequencyFirestoreRepository:
          ref.read(frequencyFirestoreRepositoryProvider),
      appUser: appUser);
});
