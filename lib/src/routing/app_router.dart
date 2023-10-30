import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/authentication/presentation/app_initialization_screen.dart';
import 'package:weatherjourney/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:weatherjourney/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:weatherjourney/src/features/locations/presentation/location_create_screen.dart';
import 'package:weatherjourney/src/features/locations/presentation/location_generate_screen.dart';
import 'package:weatherjourney/src/features/locations/presentation/location_screen.dart';
import 'package:weatherjourney/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:weatherjourney/src/features/settings/presentation/setting_screen.dart';
import 'package:weatherjourney/src/features/weather/presentation/weather_screen.dart';
import 'package:weatherjourney/src/routing/not_found_screen.dart';
import 'package:weatherjourney/src/routing/scaffold_with_nested_navigation.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorWeatherKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellWeather');
final _shellNavigatorLocationKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellLocation');
final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellSettings',
);

enum AppRoute {
  onboarding(route: "/onboarding"),
  appInitialization(route: "/appInitialization"),
  signIn(route: "/signIn"),
  signUp(route: "/signUp"),
  weather(route: "/weather"),
  locations(route: "/locations"),
  locationCreate(route: "/create"),
  locationGenerate(route: "/generate"),
  settings(route: "/settings");

  const AppRoute({required this.route});
  final String route;
}

GoRouter goRouter(ProviderRef<GoRouter> ref) {
  final userStream = ref.watch(
      appUserStreamProvider.select((value) => value.value?.firebaseAppUser));
  return GoRouter(
    initialLocation: '/weather',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = userStream != null;
      if (isLoggedIn) {
        bool isNewUser = false;
        if (userStream.metadata.creationTime != null &&
            userStream.metadata.lastSignInTime != null) {
          if ((userStream.metadata.creationTime!.microsecondsSinceEpoch -
                  userStream.metadata.lastSignInTime!.microsecondsSinceEpoch) <
              1000) {
            isNewUser = true;
          }
        }
        if (isNewUser) {
          final bool? hasSeenOnboarding =
              ref.read(appUserStreamProvider).value?.hasSeenOnboarding;
          if (hasSeenOnboarding == null || !hasSeenOnboarding) {
            if (!state.location.contains('onboarding')) return '/onboarding';
          }
        }
      } else {
        if (state.location != '/signUp' && state.location != '/signIn') {
          return '/signIn';
        }
      }
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorWeatherKey,
            routes: [
              GoRoute(
                path: AppRoute.weather.route,
                name: AppRoute.weather.name,
                pageBuilder: (context, state) {
                  final locationId = state.queryParameters['locationId'];
                  return NoTransitionPage(
                      child: WeatherScreen(
                    locationId: locationId,
                  ));
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorLocationKey,
            routes: [
              // Shopping Cart
              GoRoute(
                path: AppRoute.locations.route,
                name: AppRoute.locations.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: LocationScreen()),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: [
              // Shopping Cart
              GoRoute(
                path: AppRoute.settings.route,
                name: AppRoute.settings.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingScreen()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoute.onboarding.route,
        name: AppRoute.onboarding.name,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: OnboardingScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoute.appInitialization.route,
        name: AppRoute.appInitialization.name,
        builder: (context, state) => const AppInitializationScreen(),
      ),
      GoRoute(
        path: AppRoute.signIn.route,
        name: AppRoute.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppRoute.signUp.route,
        name: AppRoute.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.locationCreate.route,
        name: AppRoute.locationCreate.name,
        builder: (context, state) {
          return LocationCreateScreen();
        },
      ),
      GoRoute(
        path: AppRoute.locationGenerate.route,
        name: AppRoute.locationGenerate.name,
        builder: (context, state) {
          final locationId = state.queryParameters['locationId'] as String?;
          if (locationId == null) return const NotFoundScreen();
          return LocationGenerateScreen(
            locationId: locationId,
          );
        },
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return goRouter(ref);
});
