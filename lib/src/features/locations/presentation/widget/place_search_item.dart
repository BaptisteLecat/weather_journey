import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/constants/app_sizes.dart';
import 'package:weatherjourney/src/features/locations/domain/place/place.dart';
import 'package:weatherjourney/src/features/locations/presentation/controller/place_select_controller.dart';

class PlaceSearchItem extends ConsumerWidget {
  const PlaceSearchItem({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeSelectNotifier = ref.watch(placeSelectControllerProvider);
    final isSelected = placeSelectNotifier.value == place;
    return GestureDetector(
      onTap: () async {
        /*final locationRepository =
            ref.watch(locationFirestoreRepositoryProvider);
        final userStream = ref.read(appUserStreamProvider);
        final Location location = Location(
            latitude: place.lat, longitude: place.lon, city: place.displayName);
        await locationRepository.insert(
            docId: userStream.value!.id!, entity: location);*/
        ref.read(placeSelectControllerProvider.notifier).selectLocation(place);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p16, vertical: Sizes.p8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: (isSelected)
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
              width: (isSelected) ? 2 : 1),
          borderRadius: BorderRadius.circular(14),
        ),
        margin: const EdgeInsets.symmetric(vertical: Sizes.p8),
        child: Text(place.displayName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                )),
      ),
    );
  }
}
