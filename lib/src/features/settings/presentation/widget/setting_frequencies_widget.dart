import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_assistant/src/common_widgets/async_value_widget.dart';
import 'package:weather_assistant/src/constants/app_sizes.dart';
import 'package:weather_assistant/src/features/authentication/data/auth_repository.dart';
import 'package:weather_assistant/src/features/settings/data/firestore/frequency_firestore_repository.dart';

class SettingFrequenciesWidget extends StatelessWidget {
  const SettingFrequenciesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final userStateStream = ref.watch(appUserStreamProvider);
      final user = userStateStream.value;
      final frequencies = ref.watch(frequenciesListFutureProvider);

      return AsyncValueWidget(
          value: frequencies,
          data: (frequencies) => ListView.builder(
              itemCount: frequencies.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
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
                );
              }));
    });
  }
}
