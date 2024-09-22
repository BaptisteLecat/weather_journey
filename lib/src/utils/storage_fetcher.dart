import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseStorageInstanceProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instance;
});

final generationImageFutureProvider =
    FutureProvider.autoDispose.family((ref, String id) async {
  final storage = ref.watch(firebaseStorageInstanceProvider);
  try {
    return storage.ref("generations").child("$id.png").getDownloadURL();
  } catch (e) {
    //retry 3 times with 3 second delay
    int retries = 3;
    while (retries > 0) {
      Future.delayed(const Duration(seconds: 3)).then((value) async {
        print("Retrying to fetch image");
        try {
          return storage.ref("generations").child("$id.png").getDownloadURL();
        } catch (e) {
          retries--;
        }
      });
    }
    rethrow;
  }
});
