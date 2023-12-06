import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/locations/presentation/controller/place_search_controller.dart';

class LocationHeader extends ConsumerStatefulWidget {
  final TextEditingController searchController;

  const LocationHeader({
    super.key,
    required this.searchController,
  });

  @override
  ConsumerState<LocationHeader> createState() => _LocationHeaderState();
}

class _LocationHeaderState extends ConsumerState<LocationHeader> {
  bool isWriting = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: widget.searchController,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            isWriting = true;
                          } else {
                            isWriting = false;
                          }
                          setState(() {});
                        },
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {
                          if (value.isNotEmpty) {
                            ref
                                .read(placeSearchControllerProvider.notifier)
                                .searchLocationByQuery(value);
                          }
                        },
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context).textTheme.titleMedium,
                        decoration: const InputDecoration(
                          hintText: "Search a city",
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          focusedBorder: InputBorder.none,
                          focusColor: Colors.transparent,
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        if (isWriting)
                          GestureDetector(
                            onTap: () {
                              widget.searchController.clear();
                              isWriting = false;
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            //widget.isSearching.value = true;
                            ref
                                .read(placeSearchControllerProvider.notifier)
                                .searchLocationByQuery(
                                    widget.searchController.text);
                          },
                          child: Consumer(builder: (context, ref, child) {
                            final geolocationSearchControllerState =
                                ref.watch(placeSearchControllerProvider);
                            return Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color:
                                    geolocationSearchControllerState.maybeWhen(
                                  data: (value) =>
                                      Theme.of(context).primaryColor,
                                  orElse: () => Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: geolocationSearchControllerState.maybeWhen(
                                loading: () => const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                                orElse: () => const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
