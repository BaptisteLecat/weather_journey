import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/authentication/domain/app_user.dart';
import 'package:weatherjourney/src/features/feed/data/firestore/root_generation_firestore_repository.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation/root_generation.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation_like/root_generation_like.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation_user/root_generation_user.dart';
import 'package:weatherjourney/src/features/user/data/firestore/user_firestore_repository.dart';
import 'package:weatherjourney/src/features/user/domain/user/user.dart';
import 'package:weatherjourney/src/features/user/domain/user_like/user_like.dart';

class RootGenerationLikeController extends StateNotifier<AsyncValue<void>> {
  RootGenerationLikeController({
    required this.rootGenerationFirestoreRepository,
    required this.userFirestoreRepository,
    required this.ref,
  }) : super(const AsyncData(null));
  final RootGenerationFirestoreRepository rootGenerationFirestoreRepository;
  final UserFirestoreRepository userFirestoreRepository;
  final Ref ref;

  Future<void> likeRootGeneration(
      {required RootGeneration rootGeneration}) async {
    state = const AsyncLoading();

    AppUser? appUser = ref.watch(appUserStreamProvider).value;
    if (appUser == null) {
      throw Exception('User does not exist');
    }

    List<RootGenerationLike> likes = rootGeneration.likes?.toList() ?? [];
    List<UserLike> userLikes = appUser.likes?.toList() ?? [];
    final bool isLiked = await rootGenerationFirestoreRepository.isAlreadyLiked(
        docId: rootGeneration.id, userId: appUser.id!);

    if (isLiked) {
      likes.removeWhere((element) => element.user.id == appUser!.id);
      userLikes.removeWhere(
          (element) => element.rootGeneration.id == rootGeneration.id);
    } else {
      likes.add(RootGenerationLike(
          user: RootGenerationUser(
            id: appUser.id!,
            email: appUser.email!,
          ),
          createdAt: Timestamp.now()));
      userLikes.add(
          UserLike(rootGeneration: rootGeneration, createdAt: Timestamp.now()));
    }

    appUser = appUser.copyWith(likes: userLikes);
    User user = User.fromAppUser(appUser: appUser);

    //ref.invalidate(appUserStreamProvider);

    state = await AsyncValue.guard(() => Future.wait([
          rootGenerationFirestoreRepository.update(
              docId: appUser!.id!,
              entity: rootGeneration.copyWith(likes: likes)),
          userFirestoreRepository.update(docId: appUser.id!, entity: user)
        ]));
  }
}

final rootGenerationLikeControllerProvider =
    StateNotifierProvider<RootGenerationLikeController, AsyncValue<void>>(
        (ref) {
  return RootGenerationLikeController(
    rootGenerationFirestoreRepository:
        ref.read(rootGenerationFirestoreRepositoryProvider),
    userFirestoreRepository: ref.read(userFirestoreRepositoryProvider),
    ref: ref,
  );
});
