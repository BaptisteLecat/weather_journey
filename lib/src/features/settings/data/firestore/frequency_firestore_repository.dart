import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/features/settings/domain/frequency/frequency.dart';

class FrequencyFirestoreRepository {
  static String ressource = 'frequencies';
  FirebaseFirestore firestore;

  FrequencyFirestoreRepository({FirebaseFirestore? firestore})
      : firestore =
            (firestore != null) ? firestore : FirebaseFirestore.instance;

  CollectionReference<Frequency> fetchAllByCustomFilter() {
    final reference = firestore.collection(ressource).withConverter<Frequency>(
          fromFirestore: (snapshot, _) => Frequency.fromJson(snapshot.data()!),
          toFirestore: (Frequency, _) => Frequency.toJson(),
        );
    return reference;
  }

  Future<List<Frequency>> fetchAll() async {
    final reference = firestore.collection(ressource).withConverter<Frequency>(
          fromFirestore: (snapshot, _) => Frequency.fromJson(snapshot.data()!),
          toFirestore: (Frequency, _) => Frequency.toJson(),
        );
    return await reference.get().then((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Stream<List<Frequency>> fetchAllWithStream() {
    final reference = firestore.collection(ressource).withConverter<Frequency>(
          fromFirestore: (snapshot, _) => Frequency.fromJson(snapshot.data()!),
          toFirestore: (Frequency, _) => Frequency.toJson(),
        );
    return reference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future fetchOne({
    required String docId,
  }) async {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .withConverter<Frequency>(
          fromFirestore: (snapshot, _) => Frequency.fromJson(snapshot.data()!),
          toFirestore: (Frequency, _) => Frequency.toJson(),
        );
    return await reference.get().then((snapshot) {
      return snapshot.data();
    });
  }

  Stream<Frequency> fetchOneWithStream({required String docId}) {
    final reference = firestore
        .collection(ressource)
        .doc(docId)
        .withConverter<Frequency>(
          fromFirestore: (snapshot, _) => Frequency.fromJson(snapshot.data()!),
          toFirestore: (Frequency, _) => Frequency.toJson(),
        );
    return reference.snapshots().map((snapshot) {
      return snapshot.data()!;
    });
  }
}

final frequencieFirestoreRepositoryProvider =
    Provider<FrequencyFirestoreRepository>((ref) {
  return FrequencyFirestoreRepository();
});

final frequenciesListFutureProvider =
    FutureProvider.autoDispose<List<Frequency>>((
  ref,
) {
  final frequencieRepository = ref.watch(frequencieFirestoreRepositoryProvider);
  return frequencieRepository.fetchAll();
});
