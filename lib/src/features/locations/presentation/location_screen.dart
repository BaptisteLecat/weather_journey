import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/common_widgets/shimmer_list_widget.dart';
import 'package:weatherjourney/src/constants/app_sizes.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weatherjourney/src/features/locations/domain/location/location.dart';
import 'package:weatherjourney/src/features/locations/presentation/widget/location_card.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
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
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final userStream = ref.read(appUserStreamProvider);
                          final locations = ref.watch(
                              locationsListStreamProvider(
                                  userStream.value!.id!));
                          return ShimmerListWidget(
                              value: locations,
                              itemBuilder: (context, index, locations) =>
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: Sizes.p8),
                                    child: LocationCard(
                                      location: locations[index],
                                    ),
                                  ));
                        },
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
