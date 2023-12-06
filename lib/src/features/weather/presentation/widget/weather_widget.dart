import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/common_widgets/error_message_widget.dart';
import 'package:weatherjourney/src/common_widgets/glass_morphism.dart';
import 'package:weatherjourney/src/constants/app_sizes.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weatherjourney/src/features/locations/domain/location/location.dart';
import 'package:weatherjourney/src/features/locations/domain/parameters/user_id_location_parameter/user_id_location_parameter.dart';
import 'package:weatherjourney/src/features/locations/presentation/controller/location_controller.dart';
import 'package:weatherjourney/src/features/weather/data/services/weather_service.dart';
import 'package:weatherjourney/src/features/weather/presentation/widget/empty_weather.dart';
import 'package:weatherjourney/src/features/weather/presentation/widget/generation_loading.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:timezone/timezone.dart' as tz;

class WeatherWidget extends ConsumerWidget {
  final int index;
  final Location location;
  const WeatherWidget({
    super.key,
    required this.location,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var timeForLocation = tz.TZDateTime.now(tz.local);
    final userStream = ref.read(appUserStreamProvider);
    final lastGeneration = ref.watch(lastGenerationForLocationStreamProvider(
        UserIdLocationParameter(
            uid: userStream.value!.id!, location: location)));
    String cityText = location.city!.split(", ").first;
    if (location.city!.split(", ").length >= 6) {
      cityText = location.city!.split(", ").reversed.toList()[5];
    } else if (cityText.length < 3) {
      cityText = location.city!.split(", ").take(2).join(" ");
    }

    final state = ref.watch(locationControllerProvider);
    if (state.isLoading) {
      return const GenerationLoading();
    }
    return Consumer(
      builder: (context, ref, child) {
        final weatherForLocation =
            ref.watch(weatherByLocationProvider(location));
        if (weatherForLocation.value != null &&
            weatherForLocation.value!.timezone != null) {
          String timezoneString = weatherForLocation.value!.timezone!;
          var timezone = tz.getLocation(timezoneString);
          timeForLocation = tz.TZDateTime.now(timezone);
        }

        return lastGeneration.when(
          error: (e, st) =>
              Center(child: ErrorMessageWidget(e.toString(), st.toString())),
          loading: () => const GenerationLoading(),
          data: (generation) => generation == null
              ? EmptyWeather(
                  weatherForLocation: weatherForLocation.value!,
                  locationId: location.id!,
                )
              : (generation.progress != 100)
                  ? GenerationLoading(
                      generation: generation,
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                generation.generatedImage!.uri,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: Sizes.p24,
                                    right: Sizes.p24,
                                    bottom: Sizes.p48),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: SizedBox(
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${timeForLocation.hour}:${timeForLocation.minute}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: Sizes.p4,
                                              ),
                                              Text(
                                                cityText,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall!
                                                    .copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                              Text(
                                                  weatherForLocation.value
                                                              ?.current?.temp !=
                                                          null
                                                      ? "${Temp.celsius.valueToString(weatherForLocation.value!.current!.temp!)}°"
                                                      : "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 128,
                                                      )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                    const Spacer(),
                                    GlassMorphism(
                                      height: 80,
                                      borderRadius:
                                          BorderRadius.circular(Sizes.p16),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                weatherForLocation
                                                            .value
                                                            ?.current
                                                            ?.humidity !=
                                                        null
                                                    ? "${weatherForLocation.value!.current!.humidity!.round()}%"
                                                    : "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                              Text("Humidity",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        color: Colors.white,
                                                      )),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                weatherForLocation
                                                            .value
                                                            ?.current
                                                            ?.windSpeed !=
                                                        null
                                                    ? "${weatherForLocation.value!.current!.windSpeed!.round()}km/h"
                                                    : "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                              Text("Wind",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        color: Colors.white,
                                                      )),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                weatherForLocation.value
                                                            ?.current?.uvi !=
                                                        null
                                                    ? "${weatherForLocation.value!.current!.uvi!.round()} UV"
                                                    : "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                              Text("UV Index",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        color: Colors.white,
                                                      )),
                                            ],
                                          ),
                                        ],
                                      )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
