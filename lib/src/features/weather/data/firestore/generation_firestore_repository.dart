import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/features/weather/domain/generation.dart';

class GenerationFirestoreRepository {
  static String ressource = 'users';
  static String subRessource = 'generations';
  FirebaseFirestore firestore;

  GenerationFirestoreRepository({FirebaseFirestore? firestore})
      : firestore =
            (firestore != null) ? firestore : FirebaseFirestore.instance;

  CollectionReference<Generation> fetchAllByCustomFilter({
    required String docId,
  }) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
        );
    return reference;
  }

  Future<List<Generation>> fetchAllForOne({
    required String docId,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
        );
    return await reference.get().then((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Stream<List<Generation>> fetchAllForOneWithStream({
    required String docId,
  }) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
        );
    return reference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Stream<List<Generation>> fetchAllForOneOrderByCreatedAtWithStream({
    required String docId,
  }) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .orderBy('createdAt', descending: true)
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
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
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
        );
    return await reference.doc(subDocId).get().then((snapshot) {
      return snapshot.data();
    });
  }

  Stream<Generation> fetchOneWithStream(
      {required String docId, required String subDocId}) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .doc(subDocId)
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
        );
    return reference.snapshots().map((snapshot) {
      return snapshot.data()!;
    });
  }

  Future<Generation> insert({
    required String docId,
    required Generation entity,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
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
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
        );
    return await reference.doc(subDocId).delete().then((_) {
      return true;
    });
  }

  Future<Generation> update({
    required String docId,
    required Generation entity,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
        );
    return await reference
        .doc(entity.id.toString())
        .update(entity.toJson())
        .then((_) {
      return entity;
    });
  }

  CollectionReference<Generation> fetchAllForOneByCustomFilter({
    required String docId,
  }) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .collection(subRessource)
        .withConverter<Generation>(
          fromFirestore: (snapshot, _) => Generation.fromJson(snapshot.data()!),
          toFirestore: (Generation, _) => Generation.toJson(),
        );
    return reference;
  }
}

final generationFirestoreRepositoryProvider =
    Provider<GenerationFirestoreRepository>((ref) {
  return GenerationFirestoreRepository();
});
