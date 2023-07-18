import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/authentication/domain/app_user.dart';
import 'package:weather_assistant/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weather_assistant/src/features/locations/data/http/location_repository.dart';
import 'package:weather_assistant/src/features/weather/data/dto/generation_dto.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:timezone/timezone.dart' as tz;

class LocationController extends StateNotifier<AsyncValue<void>> {
  LocationController({
    required this.authRepository,
    required this.locationRepository,
    required this.locationFirestoreRepository,
    required this.appUser,
  }) : super(const AsyncData(null));
  final AuthRepository authRepository;
  final AppUser appUser;
  final LocationRepository locationRepository;
  final LocationFirestoreRepository locationFirestoreRepository;

  Future<void> deleteLocation({required String locationId}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => locationFirestoreRepository
        .deleteLocation(docId: appUser.id!, subDocId: locationId));
  }

  Future<void> generate(
      {required String locationId, required WeatherOneCall weather}) async {
    state = const AsyncLoading();
    String token = await appUser.firebaseAppUser!.getIdToken();
    String apiKey = "api_key";
    String contentType = "application/json";
    String timezoneString = weather.timezone!;
    var timezone = tz.getLocation(timezoneString);
    var now = tz.TZDateTime.now(timezone);
    GenerationDto generationDto = GenerationDto(
      time: '${now.hour} h ${now.minute} min',
      weather: weather.toString(),
    );
    state = await AsyncValue.guard(() => locationRepository.createGeneration(
        "Bearer $token", apiKey, contentType, locationId, generationDto));
  }
}

final locationControllerProvider =
    StateNotifierProvider<LocationController, AsyncValue<void>>((ref) {
  AppUser? appUser = ref.read(appUserStreamProvider).value;
  if (appUser == null) {
    throw Exception('AppUser is null');
  }
  return LocationController(
      authRepository: ref.read(authRepositoryProvider),
      locationFirestoreRepository:
          ref.read(locationFirestoreRepositoryProvider),
      locationRepository: ref.read(locationRepositoryProvider),
      appUser: appUser);
});
