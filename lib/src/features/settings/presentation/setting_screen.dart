import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherjourney/src/features/settings/presentation/controller/setting_controller.dart';
import 'package:weatherjourney/src/features/settings/presentation/widget/setting_auth_widget.dart';
import 'package:weatherjourney/src/features/settings/presentation/widget/setting_box_widget.dart';
import 'package:weatherjourney/src/features/settings/presentation/widget/setting_frequencies_widget.dart';
import 'package:weatherjourney/src/features/settings/presentation/widget/setting_header.dart';
import 'package:weatherjourney/src/features/settings/presentation/widget/setting_styles_widget.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      settingControllerProvider,
      (_, state) {
        if (state is AsyncError) {
          showDialog(
              context: context,
              builder: (context) {
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
              });
        }
      },
    );
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          const SettingHeader(),
          SettingBoxWidget(
            title: Text(
              "Generation Style",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Select a style to apply on your generated weather landscape",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black.withOpacity(0.7),
                        ),
                  ),
                ),
                const Flexible(
                  child: SizedBox(),
                )
              ],
            ),
            child: const SettingStylesWidget(),
          ),
          SettingBoxWidget(
            title: Text(
              "Generation Frequency",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Choose when you want your landscape to be generated",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black.withOpacity(0.7),
                        ),
                  ),
                ),
                const Flexible(
                  child: SizedBox(),
                )
              ],
            ),
            child: const SettingFrequenciesWidget(),
          ),
          SettingBoxWidget(
            title: Text(
              "Manage your account",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Delete your account and all your data",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black.withOpacity(0.7),
                        ),
                  ),
                ),
                const Flexible(
                  child: SizedBox(),
                )
              ],
            ),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Delete Account"),
                            content: const Text(
                                "Are you sure you want to delete your account ?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  ref
                                      .read(settingControllerProvider.notifier)
                                      .deleteAccount();
                                  context.pop();
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text("Delete"),
                              )
                            ],
                          );
                        });
                  },
                  child: const Text("Delete Account"),
                ),
                const SettingAuthWidget(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
