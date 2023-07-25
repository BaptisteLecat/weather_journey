import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/authentication/data/firestore/user_firestore_repository.dart';
import 'package:weather_assistant/src/features/onboarding/presentation/widget/onboarding_text.dart';
import 'package:weather_assistant/src/features/onboarding/presentation/widget/progress_indicator.dart';
import 'package:weather_assistant/src/routing/app_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  final int index;
  const OnboardingScreen({super.key, this.index = 0});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
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
  void didUpdateWidget(covariant OnboardingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void didChangeDependencies() {
    // Adjust the provider based on the image type
    precacheImage(
        AssetImage('assets/illustrations/onboarding${_currentPage + 1}.png'),
        context);
    super.didChangeDependencies();
  }

  void _onPageChanged() =>
      setState(() => _currentPage = _pageController.page!.toInt());

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          children: [
            for (int i = 0; i < 3; i++)
              Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/illustrations/onboarding${_currentPage + 1}.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
          ],
        ),
        Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            Expanded(
              flex: 3,
              child: Container(
                  padding: const EdgeInsets.all(48),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: PageView(
                          controller: _pageController,
                          children: [
                            OnboardingText(
                                title: "Dive into the Weather AI World",
                                description:
                                    "With Weather Journey, experience weather like you've never seen before. Let the forecast guide your imagination through real-time generated images"),
                            OnboardingText(
                                title: "Customize Your Experience",
                                description:
                                    "Whether you're into lofi or futuristic vibes, we've got you covered. Pick your preferred ambiance and watch the weather come alive in style"),
                            OnboardingText(
                                title: "Enjoy Continuous Magic",
                                description:
                                    "For our premium members, Weather Journey keeps going even in the background. Choose your favorite times of the day, and let us amaze you with breathtaking creations"),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              for (int i = 0; i < 3; i++)
                                ProgressIndicatorDot(
                                  isActive: (_currentPage == i),
                                ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              if (_currentPage == 2) {
                                final String? userId =
                                    ref.read(appUserStreamProvider).value?.id;
                                if (userId == null) {
                                  return;
                                }
                                await ref
                                    .read(userFirestoreRepositoryProvider)
                                    .updateHasSeenOnboarding(
                                      docId: userId,
                                    );
                                context.goNamed(AppRoute.weather.name);
                              }
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOutCirc);
                            },
                            child: Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        )
      ],
    ));
  }
}
