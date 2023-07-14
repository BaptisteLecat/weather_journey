import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';
import 'package:weather_assistant/src/features/locations/domain/location/location.dart';

class WeatherService {
  final WeatherFactory _weatherFactory;

  WeatherService({required String apiKey})
      : _weatherFactory = WeatherFactory(apiKey);

  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    return await _weatherFactory.currentWeatherByLocation(
      latitude,
      longitude,
    );
  }
}

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService(apiKey: "062fc09ad38f9ca00f5a46a889719fd6");
});

final weatherByLocationProvider =
    FutureProvider.family<Weather, Location>((ref, location) async {
  final service = ref.watch(weatherServiceProvider);
  return await service.getWeather(
    latitude: location.latitude,
    longitude: location.longitude,
  );
});
