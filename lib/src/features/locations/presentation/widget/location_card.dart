import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/common_widgets/async_value_widget.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weather_assistant/src/features/locations/domain/location/location.dart';
import 'package:weather_assistant/src/features/locations/domain/parameters/useruid_location_parameter.dart';
import 'package:weather_assistant/src/features/weather/data/firestore/generation_firestore_repository.dart';
import 'package:weather_assistant/src/features/weather/data/services/weather_service.dart';
import 'package:weather_assistant/src/features/weather/domain/generation/generation.dart';

class LocationCard extends StatelessWidget {
  final Location location;
  const LocationCard({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    String cityText = location.city!.split(", ").first;
    if (location.city!.split(", ").length >= 6) {
      cityText = location.city!.split(", ").reversed.toList()[5];
    } else if (cityText.length < 3) {
      cityText = location.city!.split(", ").take(2).join(" ");
    }

    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColor,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final weatherForLocation =
              ref.watch(weatherByLocationProvider(location));
          final userStream = ref.watch(appUserStreamProvider);
          final lastGenerationStreamProvider = ref.watch(
              lastGenerationForLocationStreamProvider(UseruidLocationParameter(
                  uid: userStream.value!.id!, location: location)));
          return AsyncValueWidget<Generation?>(
              value: lastGenerationStreamProvider,
              data: (lastGeneration) => Stack(
                    children: [
                      lastGeneration == null
                          ? Container()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                          sigmaX: 2.5, sigmaY: 2.5),
                                      child: Image.network(
                                        lastGeneration.generatedImage!.uri,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cityText,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(location.city!.split(", ").last,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Colors.white,
                                              )),
                                    ],
                                  ),
                                  Text(
                                      weatherForLocation.value?.temperature
                                                  ?.celsius !=
                                              null
                                          ? "${weatherForLocation.value!.temperature!.celsius!.round()}°C"
                                          : "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 42,
                                          )),
                                ],
                              )
                            ],
                          )),
                    ],
                  ));
        },
      ),
    );
  }
}
