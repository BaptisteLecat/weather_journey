import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/settings/domain/style/style.dart';
import 'package:weatherjourney/src/features/weather/domain/generation/generation.dart';

class StyleFirestoreRepository {
  static String ressource = 'styles';
  FirebaseFirestore firestore;

  StyleFirestoreRepository({FirebaseFirestore? firestore})
      : firestore =
            (firestore != null) ? firestore : FirebaseFirestore.instance;

  CollectionReference<Style> fetchAllByCustomFilter() {
    final reference = firestore.collection(ressource).withConverter<Style>(
          fromFirestore: (snapshot, _) => Style.fromJson(snapshot.data()!),
          toFirestore: (Style, _) => Style.toJson(),
        );
    return reference;
  }

  Future<List<Style>> fetchAll() async {
    final reference = firestore.collection(ressource).withConverter<Style>(
          fromFirestore: (snapshot, _) => Style.fromJson(snapshot.data()!),
          toFirestore: (Style, _) => Style.toJson(),
        );
    return await reference.get().then((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Stream<List<Style>> fetchAllWithStream() {
    final reference = firestore.collection(ressource).withConverter<Style>(
          fromFirestore: (snapshot, _) => Style.fromJson(snapshot.data()!),
          toFirestore: (Style, _) => Style.toJson(),
        );
    return reference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future fetchOne({
    required String docId,
  }) async {
    final reference =
        firestore.collection(ressource).doc(docId).withConverter<Style>(
              fromFirestore: (snapshot, _) => Style.fromJson(snapshot.data()!),
              toFirestore: (Style, _) => Style.toJson(),
            );
    return await reference.get().then((snapshot) {
      return snapshot.data();
    });
  }

  Stream<Style> fetchOneWithStream({required String docId}) {
    final reference =
        firestore.collection(ressource).doc(docId).withConverter<Style>(
              fromFirestore: (snapshot, _) => Style.fromJson(snapshot.data()!),
              toFirestore: (Style, _) => Style.toJson(),
            );
    return reference.snapshots().map((snapshot) {
      return snapshot.data()!;
    });
  }
}

final styleFirestoreRepositoryProvider =
    Provider<StyleFirestoreRepository>((ref) {
  return StyleFirestoreRepository();
});

final stylesListFutureProvider = FutureProvider.autoDispose<List<Style>>((
  ref,
) {
  final styleRepository = ref.watch(styleFirestoreRepositoryProvider);
  return styleRepository.fetchAll();
});
