import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/authentication/presentation/app_initialization_screen.dart';
import 'package:weatherjourney/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:weatherjourney/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:weatherjourney/src/features/locations/presentation/location_screen.dart';
import 'package:weatherjourney/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:weatherjourney/src/features/settings/presentation/setting_screen.dart';
import 'package:weatherjourney/src/features/weather/presentation/weather_screen.dart';
import 'package:weatherjourney/src/routing/not_found_screen.dart';

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
      GoRoute(
        path: '/onboarding',
        name: AppRoute.onboarding.name,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: OnboardingScreen(),
          );
        },
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
