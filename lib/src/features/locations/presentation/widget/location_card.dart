import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/common_widgets/shimmer_item_widget.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weatherjourney/src/features/locations/domain/location/location.dart';
import 'package:weatherjourney/src/features/locations/domain/parameters/user_id_location_parameter/user_id_location_parameter.dart';
import 'package:weatherjourney/src/features/locations/presentation/controller/location_controller.dart';
import 'package:weatherjourney/src/features/weather/data/services/weather_service.dart';
import 'package:weatherjourney/src/features/weather/domain/generation/generation.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weatherjourney/src/routing/app_router.dart';

class LocationCard extends ConsumerWidget {
  final Location location;
  const LocationCard({
    super.key,
    required this.location,
  });

  Widget _getIconButton(color, icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),

        /// set you real bg color in your content
        color: color,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String cityText = location.city!.split(", ").first;
    if (location.city!.split(", ").length >= 6) {
      cityText = location.city!.split(", ").reversed.toList()[5];
    } else if (cityText.length < 3) {
      cityText = location.city!.split(", ").take(2).join(" ");
    }
    final weatherForLocation = ref.watch(weatherByLocationProvider(location));

    return SwipeActionCell(
      key: ValueKey(location.id),
      trailingActions: [
        SwipeAction(
          color: Colors.transparent,
          content: _getIconButton(Colors.red, Icons.delete),
          onTap: (handler) async {
            ref.read(locationControllerProvider.notifier).deleteLocation(
                  locationId: location.id!,
                );
            handler(true);
          },
          nestedAction: SwipeNestedAction(
            /// customize your nested action content
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
              ),
              width: 130,
              height: 60,
              child: OverflowBox(
                maxWidth: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Delete',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ),
        SwipeAction(
          color: Colors.transparent,
          content:
              _getIconButton(Theme.of(context).primaryColor, Icons.refresh),
          onTap: (handler) async {
            ref.read(locationControllerProvider.notifier).generate(
                  locationId: location.id!,
                  weather: weatherForLocation.value!,
                );
            handler(false);
          },
        )
      ],
      child: GestureDetector(
        onTap: () {
          context.goNamed(
            AppRoute.weather.name,
            queryParameters: {
              "locationId": location.id,
            },
          );
        },
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              final userStream = ref.read(appUserStreamProvider);
              final lastGenerationStreamProvider = ref.watch(
                  lastGenerationForLocationStreamProvider(
                      UserIdLocationParameter(
                          uid: userStream.value!.id!, location: location)));
              return AsyncValueWidget<Generation?>(
                  value: lastGenerationStreamProvider,
                  data: (lastGeneration) => Stack(
                        children: [
                          lastGeneration == null
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                              sigmaX: 2.5, sigmaY: 2.5),
                                          child: Image.network(
                                              lastGeneration
                                                  .generatedImage!.uri,
                                              fit: BoxFit.fitWidth,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                            return (loadingProgress == null)
                                                ? child
                                                : ShimmerItemWidget();
                                          }),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                          weatherForLocation
                                                      .value?.current?.temp !=
                                                  null
                                              ? "${Temp.celsius.valueToString(weatherForLocation.value!.current!.temp!)}°C"
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
        ),
      ),
    );
  }
}
