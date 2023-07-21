import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/authentication/data/firestore/user_firestore_repository.dart';
import 'package:weather_assistant/src/routing/app_router.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Onboarding Screen",
          style: TextStyle(fontSize: 24),
        ),
        ElevatedButton(
            onPressed: () async {
              final userUid =
                  ref.read(appUserStreamProvider).value?.firebaseAppUser?.uid;
              if (userUid != null) {
                await ref
                    .read(userFirestoreRepositoryProvider)
                    .updateHasSeenOnboarding(docId: userUid);
                context.goNamed(AppRoute.weather.name);
              }
            },
            child: Text("Go to Weather Screen")),
      ],
    ));
  }
}
