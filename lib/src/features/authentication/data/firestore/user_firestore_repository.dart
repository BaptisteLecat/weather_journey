import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/features/authentication/domain/app_user.dart';

class AppUserFirestoreRepository {
  static String ressource = 'users';
  FirebaseFirestore firestore;

  AppUserFirestoreRepository({FirebaseFirestore? firestore})
      : firestore =
            (firestore != null) ? firestore : FirebaseFirestore.instance;

  Future<AppUser?> fetchOne({
    required String docId,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .withConverter<AppUser>(
          fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
          toFirestore: (AppUser, _) => AppUser.toJson(),
        );
    return await reference.get().then((snapshot) {
      return snapshot.data();
    });
  }

  Stream<AppUser> fetchOneWithStream({required String docId}) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .withConverter<AppUser>(
          fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
          toFirestore: (AppUser, _) => AppUser.toJson(),
        );
    //return a stream of AppUser
    return reference.snapshots().map((snapshot) {
      return snapshot.data()!;
    });
  }

  Future<void> updateStyle({
    required String docId,
    required List<String> stylesId,
  }) async {
    final reference = firestore.collection(ressource).doc(docId);
    await reference.update({'styles': stylesId});
  }

  Future<void> updateFrequency({
    required String docId,
    required List<String> frequenciesId,
  }) async {
    final reference = firestore.collection(ressource).doc(docId);
    await reference.update({'frequencies': frequenciesId});
  }
}

final userFirestoreRepositoryProvider =
    Provider<AppUserFirestoreRepository>((ref) {
  return AppUserFirestoreRepository();
});

final userStreamProvider = StreamProvider.autoDispose.family<AppUser, String>(
  (ref, docId) {
    final userRepository = ref.watch(userFirestoreRepositoryProvider);
    return userRepository.fetchOneWithStream(docId: docId);
  },
);
