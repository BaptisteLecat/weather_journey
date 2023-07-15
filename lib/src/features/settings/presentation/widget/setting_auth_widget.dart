import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/settings/presentation/controller/setting_controller.dart';

class SettingAuthWidget extends ConsumerWidget {
  const SettingAuthWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
        settingControllerProvider,
        (_, state) => showDialog(
            context: context,
            builder: (context) {
              if (state is AsyncLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AsyncError) {
                return AlertDialog(
                  title: const Text("Error"),
                  content: Text(state.error.toString()),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text("OK"),
                    )
                  ],
                );
              } else {
                return AlertDialog(
                  title: Text("Success"),
                  content: Text("You have successfully signed out"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text("OK"),
                    )
                  ],
                );
              }
            }));
    final state = ref.watch(settingControllerProvider);
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
