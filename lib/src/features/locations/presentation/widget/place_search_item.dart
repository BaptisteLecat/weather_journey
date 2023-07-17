import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weather_assistant/src/features/locations/domain/location/location.dart';
import 'package:weather_assistant/src/features/locations/domain/place/place.dart';

class PlaceSearchItem extends ConsumerWidget {
  const PlaceSearchItem({
    super.key,
    required ValueNotifier<bool> isEditing,
    required this.place,
  }) : _isEditing = isEditing;

  final ValueNotifier<bool> _isEditing;
  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        final locationRepository =
            ref.watch(locationFirestoreRepositoryProvider);
        final userStream = ref.read(appUserStreamProvider);
        final Location location = Location(
            latitude: place.lat, longitude: place.lon, city: place.displayName);
        await locationRepository.insert(
            docId: userStream.value!.id!, entity: location);
        _isEditing.value = false;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: Sizes.p8),
        child: Text(place.displayName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                )),
      ),
    );
  }
}
