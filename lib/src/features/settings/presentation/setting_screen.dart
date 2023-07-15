import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assistant/src/common_widgets/async_value_widget.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/settings/data/firestore/frequency_firestore_repository.dart';
import 'package:weather_assistant/src/features/settings/data/firestore/style_firestore_repository.dart';
import 'package:weather_assistant/src/features/settings/presentation/controller/setting_controller.dart';
import 'package:weather_assistant/src/features/settings/presentation/widget/setting_auth_widget.dart';
import 'package:weather_assistant/src/features/settings/presentation/widget/setting_box_widget.dart';
import 'package:weather_assistant/src/features/settings/presentation/widget/setting_frequencies_widget.dart';
import 'package:weather_assistant/src/features/settings/presentation/widget/setting_themes_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Settings",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SettingBoxWidget(
            title: Text(
              "Generation Theme",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Select a theme to apply on your generated weather landscape",
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
            child: SettingThemesWidget(),
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
            child: SettingFrequenciesWidget(),
          ),
          SettingAuthWidget(),
        ],
      ),
    ));
  }
}
