import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assistant/src/common_widgets/async_value_widget.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/settings/data/firestore/frequency_firestore_repository.dart';
import 'package:weather_assistant/src/features/settings/presentation/controller/setting_controller.dart';

class SettingFrequenciesWidget extends ConsumerWidget {
  const SettingFrequenciesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStateStream = ref.watch(appUserStreamProvider);
    final user = userStateStream.value;
    final frequencies = ref.watch(frequenciesListFutureProvider);
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
    final state = ref.watch(settingControllerProvider);
    return AsyncValueWidget(
        value: frequencies,
        data: (frequencies) => ListView.builder(
            itemCount: frequencies.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (frequencies[index].id == null) return;
                  ref
                      .read(settingControllerProvider.notifier)
                      .selectFrequency(frequencyId: frequencies[index].id!);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: Sizes.p8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.p20, vertical: Sizes.p16),
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
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const SizedBox(width: Sizes.p16),
                        Visibility(
                          visible: (user?.frequencies != null) &&
                              (user!.frequencies!
                                  .contains(frequencies[index].id)),
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
                ),
              );
            }));
  }
}
