import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_pack/weather_pack.dart' as wp;
import 'package:weather_assistant/src/features/locations/domain/location/location.dart';

class WeatherService {
  final wp.WeatherService _weatherFactory;

  WeatherService({required String apiKey, String language = "fr"})
      : _weatherFactory =
            wp.WeatherService(apiKey, language: wp.WeatherLanguage.french);

  Future<wp.WeatherOneCall> getWeatherOneCall({
    required double latitude,
    required double longitude,
  }) async {
    return await _weatherFactory.oneCallWeatherByLocation(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService(apiKey: "062fc09ad38f9ca00f5a46a889719fd6");
});

final weatherByLocationProvider =
    FutureProvider.family<wp.WeatherOneCall, Location>((ref, location) async {
  final service = ref.watch(weatherServiceProvider);
  return await service.getWeatherOneCall(
    latitude: location.latitude,
    longitude: location.longitude,
  );
});
