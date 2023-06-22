import 'package:flutter/material.dart';
import 'package:weather_assistant/src/common_widgets/glass_morphism.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';

class WeatherWidget extends StatelessWidget {
  final int index;
  const WeatherWidget({
    super.key,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/illustrations/temp_background$index.png',
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Sizes.p24, right: Sizes.p24, bottom: Sizes.p48),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "NANTES",
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                      borderRadius: BorderRadius.circular(Sizes.p16),
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
    );
  }
}
