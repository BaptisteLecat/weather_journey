import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/common_widgets/async_value_widget.dart';
import 'package:weather_assistant/src/common_widgets/glass_morphism.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weather_assistant/src/features/locations/domain/location/location.dart';
import 'package:weather_assistant/src/features/locations/domain/parameters/useruid_location_parameter.dart';
import 'package:weather_assistant/src/features/weather/data/generation_repository.dart';
import 'package:weather_assistant/src/features/weather/domain/generation/generation.dart';

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
    final authRepository = ref.watch(authRepositoryProvider);
    final lastGeneration = ref.watch(lastGenerationForLocationStreamProvider(
        UseruidLocationParameter(
            uid: authRepository.currentUser!.uid!, location: location)));
    String cityText = location.city!.split(", ").first;
    if (location.city!.split(", ").length >= 6) {
      cityText = location.city!.split(", ").reversed.toList()[5];
    } else if (cityText.length < 3) {
      cityText = location.city!.split(", ").take(2).join(" ");
    }
    return Consumer(
      builder: (context, ref, child) {
        return AsyncValueWidget<Generation?>(
          value: lastGeneration,
          data: (generation) => generation == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 240,
                      width: 240,
                      child: Image.asset(
                        "assets/illustrations/no_generation.png",
                      ),
                    ),
                    const SizedBox(
                      height: Sizes.p16,
                    ),
                    Text(
                      "No landscape yet",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: Sizes.p8,
                    ),
                    Text(
                      "The sky is waiting for you...",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: Sizes.p16,
                    ),
                    GestureDetector(
                      onTap: () async {
                        var token = await authRepository
                            .currentUser!.firebaseAppUser!
                            .getIdToken();
                        ref.read(generationRepositoryProvider).createGeneration(
                            "Bearer $token", "api_key", location.id!);
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "Make one",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            generation.generatedImage!.uri,
                            fit: BoxFit.fitHeight,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Sizes.p24,
                                right: Sizes.p24,
                                bottom: Sizes.p48),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cityText,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                  color: Colors.white,
                                                ),
                                          ),
                                          Text("32°",
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
                                            "64%",
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
                                            "5km/h",
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
                                            "Low",
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
                                  height: 80,
                                  borderRadius:
                                      BorderRadius.circular(Sizes.p16),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
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
