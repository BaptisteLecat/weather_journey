import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/settings/presentation/controller/setting_controller.dart';

class SettingAuthWidget extends ConsumerWidget {
  const SettingAuthWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: Sizes.p24),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(settingControllerProvider.notifier).signOut();
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
