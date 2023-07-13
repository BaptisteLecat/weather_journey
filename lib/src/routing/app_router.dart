import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/authentication/presentation/app_initialization_screen.dart';
import 'package:weather_assistant/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:weather_assistant/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:weather_assistant/src/features/locations/presentation/location_screen.dart';
import 'package:weather_assistant/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:weather_assistant/src/features/settings/presentation/setting_screen.dart';
import 'package:weather_assistant/src/features/weather/presentation/weather_screen.dart';
import 'package:weather_assistant/src/routing/not_found_screen.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  onboarding,
  appInitialization,
  signIn,
  signUp,
  weather,
  locations,
  settings,
}

GoRouter goRouter(ProviderRef<GoRouter> ref) {
  final userStream = ref.watch(appUserStreamProvider);
  return GoRouter(
    initialLocation: '/weather',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = userStream.value != null;
      if (isLoggedIn) {
        if (state.location == '/signIn') {
          return '/';
        }
      } else {
        print(state.location);
        if (state.location != '/signUp' && state.location != '/signIn') {
          return '/signIn';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        name: AppRoute.onboarding.name,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/appInitialization',
        name: AppRoute.appInitialization.name,
        builder: (context, state) => const AppInitializationScreen(),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/signUp',
        name: AppRoute.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/weather',
        name: AppRoute.weather.name,
        builder: (context, state) => const WeatherScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: AppRoute.settings.name,
        pageBuilder: (context, state) {
          return const MaterialPage(
            fullscreenDialog: true,
            child: SettingScreen(),
          );
        },
      ),
      GoRoute(
        path: '/locations',
        name: AppRoute.locations.name,
        pageBuilder: (context, state) {
          return const MaterialPage(
            fullscreenDialog: true,
            child: LocationScreen(),
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
