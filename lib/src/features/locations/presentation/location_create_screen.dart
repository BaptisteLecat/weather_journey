import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/constants/app_sizes.dart';
import 'package:weatherjourney/src/features/locations/domain/place/place.dart';
import 'package:weatherjourney/src/features/locations/presentation/controller/place_search_controller.dart';
import 'package:weatherjourney/src/features/locations/presentation/controller/place_select_controller.dart';
import 'package:weatherjourney/src/features/locations/presentation/widget/location_header.dart';
import 'package:weatherjourney/src/features/locations/presentation/widget/place_search_item.dart';
import 'package:weatherjourney/src/routing/app_router.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weatherjourney/src/features/locations/domain/location/location.dart';

class LocationCreateScreen extends ConsumerStatefulWidget {
  const LocationCreateScreen({
    super.key,
  });

  @override
  ConsumerState<LocationCreateScreen> createState() =>
      _LocationCreateScreenState();
}

class _LocationCreateScreenState extends ConsumerState<LocationCreateScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.goNamed((AppRoute.weather.name));
                        },
                        child: Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: Sizes.p24),
              Expanded(
                child: Column(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Where do you want to travel",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                              Spacer()
                            ],
                          ),
                          Text(
                              "Add a location to your list and let the AI do the rest",
                              style: Theme.of(context).textTheme.titleSmall),
                        ]),
                    const SizedBox(height: Sizes.p24),
                    LocationHeader(
                      searchController: searchController,
                    ),
                    Consumer(builder: (context, ref, child) {
                      final currentPlace =
                          ref.watch(placeSelectControllerProvider).value;
                      final placeSearchedList =
                          ref.watch(placeSearchControllerProvider);

                      if (currentPlace == null ||
                          (placeSearchedList.value != null &&
                              placeSearchedList.value!
                                  .contains(currentPlace))) {
                        return const SizedBox();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: Sizes.p24),
                          Text("Location selected",
                              style: Theme.of(context).textTheme.titleSmall),
                          PlaceSearchItem(
                              place: ref
                                  .watch(placeSelectControllerProvider)
                                  .value!),
                        ],
                      );
                    }),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: Sizes.p24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Consumer(builder: (context, ref, child) {
                                return AsyncValueWidget<List<Place>>(
                                  value:
                                      ref.watch(placeSearchControllerProvider),
                                  data: (places) => ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: places.length,
                                    itemBuilder: (context, index) {
                                      return PlaceSearchItem(
                                        place: places[index],
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //const SizedBox(height: Sizes.p24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.p16,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text("Use my location",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                          )),
                    ),
                  ),
                  const SizedBox(width: Sizes.p16),
                  Consumer(builder: (context, ref, child) {
                    final itemSelected =
                        ref.watch(placeSelectControllerProvider).value != null;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (!itemSelected) return;
                          final placeSelectNotifier =
                              ref.watch(placeSelectControllerProvider);
                          final place = placeSelectNotifier.value!;
                          final locationRepository =
                              ref.watch(locationFirestoreRepositoryProvider);
                          final userStream = ref.read(appUserStreamProvider);
                          final Location location = Location(
                              latitude: place.lat,
                              longitude: place.lon,
                              city: place.displayName);
                          final locationId = await locationRepository
                              .insert(
                                  docId: userStream.value!.id!,
                                  entity: location)
                              .then((value) => value.id);
                          context.goNamed(
                            AppRoute.weather.name,
                            queryParameters: {
                              "locationId": locationId!,
                            },
                          );
                        },
                        child: Container(
                            height: 54,
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.p16,
                            ),
                            decoration: BoxDecoration(
                              color: (itemSelected)
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: Text("Continue",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                            )),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
