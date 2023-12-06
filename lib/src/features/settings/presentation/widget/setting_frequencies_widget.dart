import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/constants/app_sizes.dart';
import 'package:weatherjourney/src/features/authentication/data/auth_repository.dart';
import 'package:weatherjourney/src/features/settings/data/firestore/frequency_firestore_repository.dart';
import 'package:weatherjourney/src/features/settings/presentation/controller/setting_controller.dart';

class SettingFrequenciesWidget extends ConsumerWidget {
  const SettingFrequenciesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStateStream = ref.watch(appUserStreamProvider);
    final user = userStateStream.value;
    final frequencies = ref.watch(frequenciesListFutureProvider);
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
                                  .map((e) => e.id)
                                  .contains(frequencies[index].id)),
                          child: Container(
                            width: Sizes.p24,
                            height: Sizes.p24,
                            decoration: const BoxDecoration(
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
