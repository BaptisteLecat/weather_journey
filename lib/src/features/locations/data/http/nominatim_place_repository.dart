import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_assistant/src/features/locations/domain/place/place.dart';

part 'nominatim_place_repository.g.dart';

@RestApi(baseUrl: "https://nominatim.openstreetmap.org")
abstract class NominatimPlaceRepository {
  factory NominatimPlaceRepository(Dio dio, {String baseUrl}) =
      _NominatimPlaceRepository;

  @GET("/search")
  Future<List<Place>> getGeneration(
    @Header("accept-language") String language,
    @Query("q") String query,
    @Query("format") String format,
    @Query("limit") int limit,
    @Query("dedupe") int dedupe,
  );
}

final placeRepositoryProvider = Provider<NominatimPlaceRepository>((ref) {
  return NominatimPlaceRepository(Dio());
});

final placesListFutureProvider =
    FutureProvider.autoDispose.family<List<Place>, String>((ref, query) {
  final locationRepository = ref.watch(placeRepositoryProvider);
  return locationRepository.getGeneration(
    'fr-FR',
    query,
    'json',
    10,
    0,
  );
});
