import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_assistant/src/features/weather/data/dto/generation_dto.dart';
import 'package:weather_assistant/src/features/weather/domain/generation/generation.dart';

part 'generation_repository.g.dart';

@RestApi(baseUrl: "https://weather-generation-api-iqazqscksq-ew.a.run.app/v1")
abstract class GenerationRepository {
  factory GenerationRepository(Dio dio, {String baseUrl}) =
      _GenerationRepository;

  @POST("/locations/{locationId}/generations")
  Future<Generation> createGeneration(
    @Header("Authorization") String token,
    @Header("api-key") String apiKey,
    @Header("Content-Type") String contentType,
    @Path("locationId") String locationId,
    @Body() GenerationDto generation,
  );
}

final generationRepositoryProvider = Provider<GenerationRepository>((ref) {
  return GenerationRepository(Dio());
});
