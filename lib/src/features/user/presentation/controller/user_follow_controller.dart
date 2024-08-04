import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/authentication/domain/app_user.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation_user/root_generation_user.dart';
import 'package:weatherjourney/src/features/user/data/firestore/user_firestore_repository.dart';
import 'package:weatherjourney/src/features/user/domain/user/user.dart';
import 'package:weatherjourney/src/features/user/domain/user_follow/user_follow.dart';

class UserFollowController extends StateNotifier<AsyncValue<void>> {
  UserFollowController({
    required this.userFirestoreRepository,
    required this.ref,
  }) : super(const AsyncData(null));
  final UserFirestoreRepository userFirestoreRepository;
  final Ref ref;

  Future<void> followRootGenerationUser(
      {required RootGenerationUser rootGenerationUser}) async {
    state = const AsyncLoading();

    AppUser? appUser = ref.watch(appUserStreamProvider).value;
    if (appUser == null) {
      throw Exception('User does not exist');
    }

    User? user =
        await userFirestoreRepository.fetchOne(docId: rootGenerationUser.id);
    if (user == null) {
      throw Exception('User does not exist');
    }

    List<UserFollow> appUserFollows = appUser.followings?.toList() ?? [];
    final bool isFollowing = await userFirestoreRepository.isFollowing(
        docId: appUser.id!, userId: user.id!);

    List<UserFollow> userFollowers = user.followers?.toList() ?? [];

    if (isFollowing) {
      appUserFollows.removeWhere((element) => element.userId == user!.id);
      userFollowers.removeWhere((element) => element.userId == appUser!.id);
    } else {
      appUserFollows.add(UserFollow(
        userId: user.id!,
        lastname: user.lastname,
        firstname: user.firstname,
        email: user.email!,
        createdAt: Timestamp.now(),
      ));
      userFollowers.add(UserFollow(
        userId: appUser.id!,
        lastname: appUser.lastname,
        firstname: appUser.firstname,
        email: appUser.email!,
        createdAt: Timestamp.now(),
      ));
    }

    appUser = appUser.copyWith(followings: appUserFollows);
    user = user.copyWith(followers: userFollowers);

    //ref.invalidate(appUserStreamProvider);

    state = await AsyncValue.guard(() => Future.wait([
          userFirestoreRepository.update(
              docId: appUser!.id!, entity: User.fromAppUser(appUser: appUser)),
          userFirestoreRepository.update(docId: user!.id!, entity: user),
        ]));
  }
}

final userFollowControllerProvider =
    StateNotifierProvider<UserFollowController, AsyncValue<void>>((ref) {
  return UserFollowController(
    userFirestoreRepository: ref.read(userFirestoreRepositoryProvider),
    ref: ref,
  );
});
