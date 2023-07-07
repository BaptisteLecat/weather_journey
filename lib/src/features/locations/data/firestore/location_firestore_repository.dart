import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/features/locations/domain/location.dart';
import 'package:weather_assistant/src/features/weather/domain/generation.dart';

class LocationFirestoreRepository {
  static String ressource = 'users';
  static String subRessource = 'locations';
  FirebaseFirestore firestore;

  LocationFirestoreRepository({FirebaseFirestore? firestore})
      : firestore =
            (firestore != null) ? firestore : FirebaseFirestore.instance;

  CollectionReference<Location> fetchAllByCustomFilter({
    required String docId,
  }) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return reference;
  }

  Future<List<Location>> fetchAllForOne({
    required String docId,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return await reference.get().then((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Stream<List<Location>> fetchAllForOneWithStream({
    required String docId,
  }) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return reference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Stream<List<Location>> fetchAllForOneOrderByCreatedAtWithStream({
    required String docId,
  }) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .orderBy('createdAt', descending: true)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return reference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future fetchOne({
    required String docId,
    required String subDocId,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return await reference.doc(subDocId).get().then((snapshot) {
      return snapshot.data();
    });
  }

  Stream<Location> fetchOneWithStream(
      {required String docId, required String subDocId}) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .doc(subDocId)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return reference.snapshots().map((snapshot) {
      return snapshot.data()!;
    });
  }

  Future<Location> insert({
    required String docId,
    required Location entity,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return await reference.doc(entity.id).set(entity).then((_) {
      return entity;
    });
  }

  Future remove({
    required String docId,
    required String subDocId,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return await reference.doc(subDocId).delete().then((_) {
      return true;
    });
  }

  Future<Location> update({
    required String docId,
    required Location entity,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return await reference
        .doc(entity.id.toString())
        .update(entity.toJson())
        .then((_) {
      return entity;
    });
  }

  CollectionReference<Location> fetchAllForOneByCustomFilter({
    required String docId,
  }) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Location>(
          fromFirestore: (snapshot, _) => Location.fromJson(snapshot.data()!),
          toFirestore: (Location, _) => Location.toJson(),
        );
    return reference;
  }
}

final locationFirestoreRepositoryProvider =
    Provider<LocationFirestoreRepository>((ref) {
  return LocationFirestoreRepository();
});

final locationsListFutureProvider =
    FutureProvider.autoDispose.family<List<Location>, String>((ref, docId) {
  final locationRepository = ref.watch(locationFirestoreRepositoryProvider);
  return locationRepository.fetchAllForOne(docId: docId);
});
