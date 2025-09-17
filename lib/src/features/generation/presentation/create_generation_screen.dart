import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/features/generation/data/firestore/style_firestore_repository.dart';
import 'package:weatherjourney/src/features/generation/presentation/custom_sun_widget.dart';
import 'package:weatherjourney/src/utils/storage_fetcher.dart';

class CreateGenerationScreen extends ConsumerWidget {
  const CreateGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> time_day = [
      "assets/illustrations/time_day/0_dawn.png",
      "assets/illustrations/time_day/1_morning.png",
      "assets/illustrations/time_day/2_noon.png",
      "assets/illustrations/time_day/3_afternoon.png",
      "assets/illustrations/time_day/4_evening.png",
      "assets/illustrations/time_day/5_dusk.png",
      "assets/illustrations/time_day/6_night.png",
    ];
    return SafeArea(
      child: Scaffold(
        // Ajoutez le bouton flottant ici
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Code pour générer
          },
          label: Text(
            'Generate',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
          icon: Icon(Icons.play_arrow),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Options",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Minimum of 2 options",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 44,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Center(
                          child: Text(
                        "Futuristic $index",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                      )),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose a style of picture",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: AsyncValueWidget(
                          value: ref.watch(stylesListFutureProvider),
                          data: (styles) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: styles.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(38),
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(38),
                                      child: AsyncValueWidget(
                                          value: ref.watch(styleImageProvider(
                                              styles[index].id)),
                                          data: (imageUrl) {
                                            return Image.network(
                                              imageUrl,
                                              fit: BoxFit.fill,
                                            );
                                          }),
                                    ),
                                  );
                                });
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Frequency of generation",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: SunPathSelector(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
