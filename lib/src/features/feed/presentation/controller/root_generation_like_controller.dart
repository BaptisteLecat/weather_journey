import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/authentication/domain/app_user.dart';
import 'package:weatherjourney/src/features/feed/data/firestore/root_generation_firestore_repository.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation/root_generation.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation_like/root_generation_like.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation_user/root_generation_user.dart';

class RootGenerationLikeController extends StateNotifier<AsyncValue<void>> {
  RootGenerationLikeController({
    required this.rootGenerationFirestoreRepository,
    required this.appUser,
  }) : super(const AsyncData(null));
  final AppUser appUser;
  final RootGenerationFirestoreRepository rootGenerationFirestoreRepository;

  Future<void> likeRootGeneration(
      {required RootGeneration rootGeneration}) async {
    state = const AsyncLoading();
    List<RootGenerationLike> likes = rootGeneration.likes?.toList() ?? [];
    final bool isLiked = await rootGenerationFirestoreRepository.isAlreadyLiked(
        docId: rootGeneration.id, userId: appUser.id!);

    if (isLiked) {
      likes.removeWhere((element) => element.user.id == appUser.id);
    } else {
      likes.add(RootGenerationLike(
          user: RootGenerationUser(
            id: appUser.id!,
            email: appUser.email!,
          ),
          createdAt: Timestamp.now()));
    }
    state = await AsyncValue.guard(() =>
        rootGenerationFirestoreRepository.update(
            docId: appUser.id!, entity: rootGeneration.copyWith(likes: likes)));
  }
}

final rootGenerationLikeControllerProvider =
    StateNotifierProvider<RootGenerationLikeController, AsyncValue<void>>(
        (ref) {
  AppUser? appUser = ref.read(appUserStreamProvider).value;
  if (appUser == null) {
    throw Exception('AppUser is null');
  }
  return RootGenerationLikeController(
      rootGenerationFirestoreRepository:
          ref.read(rootGenerationFirestoreRepositoryProvider),
      appUser: appUser);
});
