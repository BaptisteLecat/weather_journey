import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/locations/application/services/geolocation_service.dart';
import 'package:weatherjourney/src/features/locations/data/http/nominatim_place_repository.dart';
import 'package:weatherjourney/src/features/locations/domain/place/place.dart';

class PlaceSearchController extends StateNotifier<AsyncValue<List<Place>>> {
  PlaceSearchController({
    required this.placeRepository,
    required this.geolocationService,
  }) : super(const AsyncData([]));
  final NominatimPlaceRepository placeRepository;
  final GeolocationService geolocationService;

  /*Future<Place?> searchLocationByLatLon() async {
    state = const AsyncLoading();
    final geolocation = await geolocationService.determinePosition();
    state = await AsyncValue.guard(() => placeRepository.searchLocationByLatLon(
          'fr-FR',
          geolocation.latitude,
          geolocation.longitude,
          'json',
          10,
          0,
        ));
  }*/

  Future searchLocationByQuery(String query) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => placeRepository.searchLocationByQuery(
          'fr-FR',
          query,
          'json',
          4,
          0,
        ));
  }
}

final placeSearchControllerProvider = StateNotifierProvider.autoDispose<
    PlaceSearchController, AsyncValue<List<Place>>>((ref) {
  return PlaceSearchController(
      placeRepository: ref.read(placeRepositoryProvider),
      geolocationService: ref.read(geolocationServiceProvider));
});
