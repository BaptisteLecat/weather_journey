import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assistant/src/common_widgets/async_value_widget.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weather_assistant/src/features/locations/data/http/nominatim_place_repository.dart';
import 'package:weather_assistant/src/features/locations/domain/location/location.dart';
import 'package:weather_assistant/src/features/locations/domain/place/place.dart';
import 'package:weather_assistant/src/features/locations/presentation/widget/location_card.dart';
import 'package:weather_assistant/src/features/locations/presentation/widget/location_header.dart';
import 'package:weather_assistant/src/features/locations/presentation/widget/place_search_item.dart';
import 'package:weather_assistant/src/routing/app_router.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final ValueNotifier<bool> _isEditing = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isSearching = ValueNotifier<bool>(false);
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isEditing.addListener(() {
      _isSearching.value = !_isEditing.value;
      if (!_isEditing.value) {
        searchController.clear();
      }
      setState(() {});
    });

    _isSearching.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _isEditing.dispose();
    searchController.dispose();
    _isSearching.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Locations",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoute.settings.name);
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
                              Icons.settings,
                              color: Colors.black,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: Sizes.p16),
                      GestureDetector(
                        onTap: () {
                          context.pop();
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: Sizes.p24,
                  left: Sizes.p24,
                  right: Sizes.p24,
                ),
                child: Column(
                  children: [
                    LocationHeader(
                      isWriting: _isEditing,
                      isSearching: _isSearching,
                      searchController: searchController,
                    ),
                    const SizedBox(height: Sizes.p16),
                    Visibility(
                        visible: _isEditing.value,
                        child: Expanded(
                          child: Consumer(builder: (context, ref, child) {
                            if (!_isSearching.value) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _isSearching.value = true;
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: Sizes.p16,
                                          vertical: Sizes.p8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text("Valider la recherche",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    color: Colors.white))),
                                  ),
                                ],
                              );
                            }
                            final places = ref.watch(placesListFutureProvider(
                                searchController.text));

                            return AsyncValueWidget<List<Place>>(
                              value: places,
                              data: (places) => ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: places.length,
                                itemBuilder: (context, index) {
                                  return PlaceSearchItem(
                                    isEditing: _isEditing,
                                    place: places[index],
                                  );
                                },
                              ),
                            );
                          }),
                        )),
                    Visibility(
                      visible: !_isEditing.value,
                      child: Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Text(
                              "Added Locations",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: Sizes.p16),
                            Consumer(
                              builder: (context, ref, child) {
                                final userStream =
                                    ref.read(appUserStreamProvider);
                                final locations = ref.watch(
                                    locationsListStreamProvider(
                                        userStream.value!.id!));
                                return AsyncValueWidget<List<Location>>(
                                  value: locations,
                                  data: (locations) => ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: locations.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: Sizes.p8),
                                        child: LocationCard(
                                          location: locations[index],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: Sizes.p24),
                            /*Text(
                              "Recommended",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: Sizes.p16),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: Sizes.p8),
                                  //child: LocationCard(),
                                );
                              },
                            ),*/
                            const SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
