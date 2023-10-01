import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/locations/domain/place/place.dart';

class PlaceSelectController extends StateNotifier<AsyncValue<Place?>> {
  PlaceSelectController() : super(const AsyncData(null));

  void selectLocation(Place place) {
    state = AsyncValue.data(place);
  }
}

final placeSelectControllerProvider = StateNotifierProvider.autoDispose<
    PlaceSelectController, AsyncValue<Place?>>((ref) {
  return PlaceSelectController();
});
