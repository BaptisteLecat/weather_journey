import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weatherjourney/src/features/locations/domain/place/place.dart';
import 'package:weatherjourney/src/utils/dio_fetcher.dart';

part 'nominatim_place_repository.g.dart';

@RestApi(baseUrl: "https://nominatim.openstreetmap.org")
abstract class NominatimPlaceRepository {
  factory NominatimPlaceRepository(Dio dio, {String baseUrl}) =
      _NominatimPlaceRepository;

  @GET("/search")
  Future<List<Place>> searchLocationByQuery(
    @Header("accept-language") String language,
    @Query("q") String query,
    @Query("format") String format,
    @Query("limit") int limit,
    @Query("dedupe") int dedupe,
  );

  @GET("/reverse")
  Future<Place?> searchLocationByLatLon(
    @Header("accept-language") String language,
    @Query("lat") double lat,
    @Query("lon") double lon,
    @Query("format") String format,
    @Query("limit") int limit,
    @Query("dedupe") int dedupe,
  );
}

final placeRepositoryProvider = Provider<NominatimPlaceRepository>((ref) {
  final dio = ref.watch(dioFetcherProvider);
  return NominatimPlaceRepository(dio);
});

final placesListFutureProvider =
    FutureProvider.autoDispose.family<List<Place>, String>((ref, query) {
  final locationRepository = ref.watch(placeRepositoryProvider);
  return locationRepository.searchLocationByQuery(
    'fr-FR',
    query,
    'json',
    10,
    0,
  );
});

final placesListFutureProviderByLatLon =
    FutureProvider.family<Place?, List<double>>((ref, latLon) {
  final locationRepository = ref.watch(placeRepositoryProvider);
  return locationRepository.searchLocationByLatLon(
    'fr-FR',
    latLon[0],
    latLon[1],
    'json',
    10,
    0,
  );
});
