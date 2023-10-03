import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weatherjourney/src/features/locations/domain/parameters/user_id_location_id_parameter.dart/user_id_location_id_parameter.dart';
import 'package:weatherjourney/src/features/locations/domain/parameters/user_id_location_parameter/user_id_location_parameter.dart';
import 'package:weatherjourney/src/features/locations/presentation/controller/location_controller.dart';
import 'package:weatherjourney/src/features/weather/data/services/weather_service.dart';
import 'package:weatherjourney/src/features/weather/presentation/widget/weather_widget.dart';

class LocationGenerateScreen extends ConsumerWidget {
  final String locationId;
  const LocationGenerateScreen({
    super.key,
    required this.locationId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(appUserStreamProvider);

    final location = ref.watch(locationByIdStreamProvider(
        UserIdLocationIdParameter(
            userId: userStream.value!.id!, locationId: locationId)));
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final lastGeneration = ref.watch(
                  lastGenerationForLocationStreamProvider(
                      UserIdLocationParameter(
                          uid: userStream.value!.id!,
                          location: location.value!)));
              return AsyncValueWidget(
                  value: location,
                  data: (location) => WeatherWidget(
                        location: location,
                      ));
            }),
          ),
        ],
      ),
    );
  }
}
