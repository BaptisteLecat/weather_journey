import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation/root_generation.dart';
import 'package:weatherjourney/src/features/user/domain/user/user.dart';

class RootGenerationFirestoreRepository {
  static String ressource = 'generations';
  FirebaseFirestore firestore;

  RootGenerationFirestoreRepository({FirebaseFirestore? firestore})
      : firestore =
            (firestore != null) ? firestore : FirebaseFirestore.instance;

  CollectionReference<RootGeneration> fetchAllByCustomFilter() {
    final reference =
        firestore.collection(ressource).withConverter<RootGeneration>(
              fromFirestore: (snapshot, _) =>
                  RootGeneration.fromJson(snapshot.data()!),
              toFirestore: (rootGeneration, _) => rootGeneration.toJson(),
            );
    return reference;
  }

  Future<List<RootGeneration>> fetchAll() async {
    final reference =
        firestore.collection(ressource).withConverter<RootGeneration>(
              fromFirestore: (snapshot, _) =>
                  RootGeneration.fromJson(snapshot.data()!),
              toFirestore: (rootGeneration, _) => rootGeneration.toJson(),
            );
    return await reference.get().then((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<List<RootGeneration>> fetchAllMostLiked() async {
    final reference =
        firestore.collection(ressource).withConverter<RootGeneration>(
              fromFirestore: (snapshot, _) =>
                  RootGeneration.fromJson(snapshot.data()!),
              toFirestore: (rootGeneration, _) => rootGeneration.toJson(),
            );
    return await reference
        .orderBy('likesCount', descending: true)
        .get()
        .then((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<List<RootGeneration>> fetchAllFromFollowedUsers(
      {required List<String> followedUsersIds}) async {
    print('fetch all from followed users');
    final reference =
        firestore.collection(ressource).withConverter<RootGeneration>(
              fromFirestore: (snapshot, _) =>
                  RootGeneration.fromJson(snapshot.data()!),
              toFirestore: (rootGeneration, _) => rootGeneration.toJson(),
            );
    return await reference
        .where('user.id', whereIn: followedUsersIds)
        .get()
        .then((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<RootGeneration?> fetchOne({
    required String docId,
  }) async {
    final reference =
        firestore.collection(ressource).withConverter<RootGeneration>(
              fromFirestore: (snapshot, _) =>
                  RootGeneration.fromJson(snapshot.data()!),
              toFirestore: (rootGeneration, _) => rootGeneration.toJson(),
            );
    return await reference.doc(docId).get().then((snapshot) {
      return snapshot.data();
    });
  }

  Stream<RootGeneration> fetchOneWithStream({required String docId}) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .withConverter<RootGeneration>(
          fromFirestore: (snapshot, _) =>
              RootGeneration.fromJson(snapshot.data()!),
          toFirestore: (rootGeneration, _) => rootGeneration.toJson(),
        );
    return reference.snapshots().map((snapshot) {
      return snapshot.data()!;
    });
  }

  Future<RootGeneration> update({
    required String docId,
    required RootGeneration entity,
  }) async {
    final reference =
        firestore.collection(ressource).withConverter<RootGeneration>(
              fromFirestore: (snapshot, _) =>
                  RootGeneration.fromJson(snapshot.data()!),
              toFirestore: (rootGeneration, _) => rootGeneration.toJson(),
            );
    return await reference
        .doc(entity.id.toString())
        .update(entity.toJson())
        .then((_) {
      return entity;
    });
  }

  Future<bool> isAlreadyLiked({
    required String docId,
    required String userId,
  }) async {
    final reference =
        firestore.collection(ressource).withConverter<RootGeneration>(
              fromFirestore: (snapshot, _) =>
                  RootGeneration.fromJson(snapshot.data()!),
              toFirestore: (rootGeneration, _) => rootGeneration.toJson(),
            );
    return await reference.doc(docId).get().then((snapshot) {
      final rootGeneration = snapshot.data();
      if (rootGeneration != null) {
        if (rootGeneration.likes != null) {
          return rootGeneration.likes!.any((like) => like.user.id == userId);
        }
      }
      return false;
    });
  }
}

final rootGenerationFirestoreRepositoryProvider =
    Provider<RootGenerationFirestoreRepository>((ref) {
  return RootGenerationFirestoreRepository();
});

final rootGenerationFetchAllFutureProvider =
    FutureProvider.autoDispose((ref) async {
  final rootGenerationRepository =
      ref.watch(rootGenerationFirestoreRepositoryProvider);
  return rootGenerationRepository.fetchAll();
});

final rootGenerationFetchAllMostLikedFutureProvider =
    FutureProvider.autoDispose((ref) async {
  final rootGenerationRepository =
      ref.watch(rootGenerationFirestoreRepositoryProvider);
  return rootGenerationRepository.fetchAllMostLiked();
});

final rootGenerationFetchAllFromFollowedUsersFutureProvider =
    FutureProvider.family((ref, User? user) async {
  final rootGenerationRepository =
      ref.watch(rootGenerationFirestoreRepositoryProvider);
  final followedUsersIds =
      user?.followings?.map((e) => e.userId).toList() ?? [];
  if (followedUsersIds.isEmpty) return <RootGeneration>[];
  return rootGenerationRepository.fetchAllFromFollowedUsers(
      followedUsersIds: followedUsersIds);
});

final rootGenerationFetchOneStreamProvider =
    StreamProvider.autoDispose.family((ref, String docId) {
  final rootGenerationRepository =
      ref.watch(rootGenerationFirestoreRepositoryProvider);
  return rootGenerationRepository.fetchOneWithStream(docId: docId);
});

final rootGenerationFetchOneFutureProvider =
    FutureProvider.autoDispose.family((ref, String docId) async {
  final rootGenerationRepository =
      ref.watch(rootGenerationFirestoreRepositoryProvider);
  return rootGenerationRepository.fetchOne(docId: docId);
});
