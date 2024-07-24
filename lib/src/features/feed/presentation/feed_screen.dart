import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/features/feed/data/firestore/root_generation_firestore_repository.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation/root_generation.dart';
import 'package:weatherjourney/src/features/user/data/firestore/user_firestore_repository.dart';
import 'package:weatherjourney/src/features/user/domain/user/user.dart';
import 'package:weatherjourney/src/routing/app_router.dart';

class FeedPageScreen extends ConsumerWidget {
  const FeedPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const FeedHeaderWidget(),
        toolbarHeight: 78,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              icon: const Icon(IconsaxPlusLinear.notification),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 190,
                child: AsyncValueWidget<List<RootGeneration>>(
                    value: ref.watch(rootGenerationFetchAllFutureProvider),
                    data: (data) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 16 : 0,
                              ),
                              child: WeatherHighlightWidget(
                                rootGeneration: data[index],
                              ));
                        },
                      );
                    }),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Start a weather tour',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AsyncValueWidget<List<RootGeneration>>(
                  value: ref.watch(rootGenerationFetchAllFutureProvider),
                  data: (data) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(
                                '${AppRoute.generations.route}/${data[index].id}');
                          },
                          child: Hero(
                            tag: data[index].id,
                            child: Container(
                              height: 250,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${data[index].generation.generatedImage?.uri}"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(36),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 42,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                IconsaxPlusBold.location,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                "${data[index].location.getCityText()}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data[index].generation.prompt,
                                                maxLines: 3,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                              ),
                                              const SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  Text('Today',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium!
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                                  const SizedBox(width: 6),
                                                  Icon(
                                                    IconsaxPlusBold.sun_1,
                                                    size: 16,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text('18°C',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium!
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class WeatherHighlightWidget extends ConsumerWidget {
  final RootGeneration rootGeneration;
  const WeatherHighlightWidget({
    super.key,
    required this.rootGeneration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              NetworkImage("${rootGeneration.generation.generatedImage?.uri}"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(36),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: AsyncValueWidget<User?>(
                        value: ref.watch(
                            userfetchOneFutureProvider(rootGeneration.user.id)),
                        data: (data) {
                          return Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  (data?.avatar == null) ? Colors.white : null,
                              image: (data?.avatar != null)
                                  ? DecorationImage(
                                      image: NetworkImage("${data?.avatar}"),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  IconsaxPlusBold.location,
                  size: 16,
                  color: Colors.white,
                ),
                const SizedBox(width: 6),
                Text("${rootGeneration.location.getCityText()}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FeedHeaderWidget extends StatelessWidget {
  const FeedHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Weather',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text('Journey',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
      ],
    );
  }
}
