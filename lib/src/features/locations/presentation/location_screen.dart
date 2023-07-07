import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/common_widgets/async_value_widget.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weather_assistant/src/features/locations/domain/location.dart';
import 'package:weather_assistant/src/features/locations/presentation/widget/location_card.dart';
import 'package:weather_assistant/src/features/locations/presentation/widget/location_header.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
          top: 74,
          left: Sizes.p24,
          right: Sizes.p24,
        ),
        children: [
          const LocationHeader(),
          const SizedBox(height: Sizes.p24),
          Text(
            "Added Locations",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: Sizes.p16),
          Consumer(
            builder: (context, ref, child) {
              final authRepository = ref.watch(authRepositoryProvider);
              final products = ref.watch(locationsListFutureProvider(
                  authRepository.currentUser!.uid!));
              return AsyncValueWidget<List<Location>>(
                value: products,
                data: (products) => ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: Sizes.p8),
                      child: LocationCard(),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: Sizes.p24),
          Text(
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
                margin: const EdgeInsets.symmetric(vertical: Sizes.p8),
                child: LocationCard(),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
