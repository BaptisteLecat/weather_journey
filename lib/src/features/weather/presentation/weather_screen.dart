import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/constants/app_sizes.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weatherjourney/src/features/locations/domain/location/location.dart';
import 'package:weatherjourney/src/features/locations/presentation/widget/empty_location.dart';
import 'package:weatherjourney/src/features/weather/data/firestore/generation_firestore_repository.dart';
import 'package:weatherjourney/src/features/locations/data/http/location_repository.dart';
import 'package:weatherjourney/src/features/weather/presentation/widget/weather_widget.dart';
import 'package:weatherjourney/src/routing/app_router.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  final int index;
  const WeatherScreen({super.key, this.index = 0});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  late final PageController _pageController =
      PageController(initialPage: widget.index);

  late int _currentPage = widget.index;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant WeatherScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pageController.jumpToPage(widget.index);
  }

  void _onPageChanged() =>
      setState(() => _currentPage = _pageController.page!.toInt());

  @override
  Widget build(BuildContext context) {
    final userStream = ref.read(appUserStreamProvider);
    final locations =
        ref.watch(locationsListStreamProvider(userStream.value!.id!));
    context.goNamed((AppRoute.locationCreate.name));
    return Scaffold(
      body: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              return AsyncValueWidget<List<Location>>(
                value: locations,
                data: (locations) => locations.length == 0
                    ? const EmptyLocation()
                    : PageView(
                        controller: _pageController,
                        children: locations.map((e) {
                          return WeatherWidget(
                            index: locations.indexOf(e),
                            location: e,
                          );
                        }).toList(),
                      ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: Sizes.p24, top: 64, left: Sizes.p24, right: Sizes.p24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                (locations.asData != null)
                    ? SizedBox(
                        height: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0;
                                i < locations.asData!.value.length;
                                i++)
                              Container(
                                height: 10,
                                width: 10,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  color: _currentPage == i
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                          ],
                        ))
                    : SizedBox(
                        height: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
