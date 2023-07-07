import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assistant/src/common_widgets/glass_morphism.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/weather/data/firestore/generation_firestore_repository.dart';
import 'package:weather_assistant/src/features/weather/data/generation_repository.dart';
import 'package:weather_assistant/src/features/weather/presentation/widget/weather_widget.dart';
import 'package:weather_assistant/src/routing/app_router.dart';

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
    final generationRepository = ref.watch(generationRepositoryProvider);
    final authRepository = ref.watch(authRepositoryProvider);
    final generationFirestoreRepository =
        ref.watch(generationFirestoreRepositoryProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final idToken =
              await authRepository.currentUser!.firebaseAppUser!.getIdToken();
          final generation = await generationRepository
              .getGeneration("Bearer $idToken", "api_key")
              .catchError((Object e) {
            final res = (e as DioError).error;
            debugPrint(e.toString());
          });
          generationFirestoreRepository
              .fetchOneWithStream(
                  docId: authRepository.currentUser!.uid!,
                  subDocId: generation.id!)
              .listen((event) {
            print(event.progress.toString());
          });
          print(generation);
        },
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              WeatherWidget(
                index: 0,
              ),
              WeatherWidget(
                index: 1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: Sizes.p24,
                top: Sizes.p48,
                left: Sizes.p24,
                right: Sizes.p24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                        onPressed: () {
                          context.pushNamed(AppRoute.locations.name);
                        },
                        icon: Icon(
                          Icons.menu_rounded,
                          size: 44,
                          color: Colors.white,
                        )),
                  ]),
                ),
                Container(
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: _currentPage == 0
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: _currentPage == 1
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
