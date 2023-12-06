import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherjourney/src/features/locations/presentation/controller/location_controller.dart';
import 'package:weather_pack/weather_pack.dart';

class EmptyWeather extends ConsumerWidget {
  final WeatherOneCall weatherForLocation;
  final String locationId;
  const EmptyWeather(
      {super.key, required this.weatherForLocation, required this.locationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 48,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          Column(
            children: [
              SvgPicture.asset(
                'assets/icons/weather/partly-cloudy-day.svg',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'No generations for this location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              ref.read(locationControllerProvider.notifier).generate(
                    locationId: locationId,
                    weather: weatherForLocation,
                  );
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Generate',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
