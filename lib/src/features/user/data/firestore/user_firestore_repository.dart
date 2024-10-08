import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/user/domain/user/user.dart';

class UserFirestoreRepository {
  static String ressource = 'users';
  FirebaseFirestore firestore;

  UserFirestoreRepository({FirebaseFirestore? firestore})
      : firestore =
            (firestore != null) ? firestore : FirebaseFirestore.instance;

  CollectionReference<User> fetchAllByCustomFilter() {
    final reference = firestore.collection(ressource).withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return reference;
  }

  Future<List<User>> fetchAll() async {
    final reference = firestore.collection(ressource).withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return await reference.get().then((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<User?> fetchOne({
    required String docId,
  }) async {
    final reference = firestore.collection(ressource).withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return await reference.doc(docId).get().then((snapshot) {
      return snapshot.data();
    });
  }

  Stream<User> fetchOneWithStream({required String docId}) {
    final reference =
        firestore.collection(ressource).doc(docId).withConverter<User>(
              fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
              toFirestore: (user, _) => user.toJson(),
            );
    return reference.snapshots().map((snapshot) {
      return snapshot.data()!;
    });
  }

  Future<User> update({
    required String docId,
    required User entity,
  }) async {
    final reference = firestore.collection(ressource).withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return await reference
        .doc(entity.id.toString())
        .update(entity.toJson())
        .then((_) {
      return entity;
    });
  }

  /// Check if a user is already following another user
  Future<bool> isFollowing({
    required String docId,
    required String userId,
  }) async {
    final reference = firestore.collection(ressource).withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return await reference.doc(docId).get().then((snapshot) {
      final user = snapshot.data();
      if (user == null || user.followings == null) {
        return false;
      }
      return user.followings!.any((element) => element.userId == userId);
    });
  }

  /// Check if a user is followed by another user
  Future<bool> isFollowed({
    required String docId,
    required String userId,
  }) async {
    final reference = firestore.collection(ressource).withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return await reference.doc(docId).get().then((snapshot) {
      final user = snapshot.data();
      if (user == null || user.followers == null) {
        return false;
      }
      return user.followers!.any((element) => element.userId == userId);
    });
  }
}

final userFirestoreRepositoryProvider =
    Provider<UserFirestoreRepository>((ref) {
  return UserFirestoreRepository();
});

final userfetchAllFutureProvider = FutureProvider.autoDispose((ref) async {
  final userRepository = ref.watch(userFirestoreRepositoryProvider);
  return userRepository.fetchAll();
});

final userfetchOneFutureProvider = FutureProvider.family<User?, String>(
  (ref, String docId) async {
    final userRepository = ref.watch(userFirestoreRepositoryProvider);
    return userRepository.fetchOne(docId: docId);
  },
);

final userfetchOneStreamProvider =
    StreamProvider.autoDispose.family<User, String>(
  (ref, String docId) {
    final userRepository = ref.watch(userFirestoreRepositoryProvider);
    return userRepository.fetchOneWithStream(docId: docId);
  },
);
