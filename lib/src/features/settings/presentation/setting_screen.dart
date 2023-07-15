import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assistant/src/common_widgets/async_value_widget.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/settings/data/firestore/frequency_firestore_repository.dart';
import 'package:weather_assistant/src/features/settings/data/firestore/style_firestore_repository.dart';
import 'package:weather_assistant/src/features/settings/presentation/controller/setting_controller.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

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
          Padding(
            padding: const EdgeInsets.only(
                left: Sizes.p24, right: Sizes.p24, top: Sizes.p24),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p16, vertical: Sizes.p24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Generation Theme",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: Sizes.p8),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Select a theme to apply on your generated weather landscape",
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                  ),
                                ),
                                const Flexible(
                                  child: SizedBox(),
                                )
                              ],
                            ),
                            const SizedBox(height: Sizes.p16),
                            Expanded(
                              child: Consumer(builder: (context, ref, child) {
                                final userStateStream =
                                    ref.watch(appUserStreamProvider);
                                final user = userStateStream.value;
                                final styles =
                                    ref.watch(stylesListFutureProvider);

                                return AsyncValueWidget(
                                    value: styles,
                                    data: (styles) => ListView.builder(
                                        itemCount: styles.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: Sizes.p8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Sizes.p20,
                                                      vertical: Sizes.p16),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      styles[index].name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width: Sizes.p16),
                                                  Visibility(
                                                    visible: (user?.styles !=
                                                            null) &&
                                                        (user!.styles!.contains(
                                                            styles[index].id)),
                                                    child: Container(
                                                      width: Sizes.p24,
                                                      height: Sizes.p24,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.green,
                                                      ),
                                                      child: const Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                        size: Sizes.p16,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }));
                              }),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Sizes.p24, right: Sizes.p24, top: Sizes.p24),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p16, vertical: Sizes.p24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Generation Frequency",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: Sizes.p8),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Choose when you want your landscape to be generated",
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                  ),
                                ),
                                const Flexible(
                                  child: SizedBox(),
                                )
                              ],
                            ),
                            const SizedBox(height: Sizes.p16),
                            Expanded(
                              child: Consumer(builder: (context, ref, child) {
                                final userStateStream =
                                    ref.watch(appUserStreamProvider);
                                final user = userStateStream.value;
                                final frequencies =
                                    ref.watch(frequenciesListFutureProvider);

                                return AsyncValueWidget(
                                    value: frequencies,
                                    data: (frequencies) => ListView.builder(
                                        itemCount: frequencies.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: Sizes.p8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Sizes.p20,
                                                      vertical: Sizes.p16),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      frequencies[index].name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width: Sizes.p16),
                                                  Visibility(
                                                    visible: (user
                                                                ?.frequencies !=
                                                            null) &&
                                                        (user!.frequencies!
                                                            .contains(
                                                                frequencies[
                                                                        index]
                                                                    .id)),
                                                    child: Container(
                                                      width: Sizes.p24,
                                                      height: Sizes.p24,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.green,
                                                      ),
                                                      child: const Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                        size: Sizes.p16,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }));
                              }),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          //logout button
          Container(
            margin: const EdgeInsets.only(top: Sizes.p24),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(settingControllerProvider.notifier).signOut();
                },
                child: const Text("Logout"),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
