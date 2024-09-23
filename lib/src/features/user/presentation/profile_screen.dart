import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/features/locations/data/firestore/location_firestore_repository.dart';
import 'package:weatherjourney/src/features/locations/domain/parameters/user_id_location_parameter/user_id_location_parameter.dart';
import 'package:weatherjourney/src/features/user/data/firestore/user_firestore_repository.dart';
import 'package:weatherjourney/src/routing/app_router.dart';
import 'package:weatherjourney/src/utils/storage_fetcher.dart';

class ProfileScreen extends ConsumerWidget {
  final String userId;
  const ProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AsyncValueWidget(
              value: ref.watch(userfetchOneStreamProvider(userId)),
              data: (user) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.settings),
                                onPressed: () {
                                  GoRouter.of(context)
                                      .push(AppRoute.settings.route);
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (user.avatar == null)
                                      ? Colors.white
                                      : null,
                                  image: (user.avatar != null)
                                      ? DecorationImage(
                                          image: NetworkImage("${user.avatar}"),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                user.displayName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        user.followers!.length.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "followers",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        user.likes!.length.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "likes",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        user.followings!.length.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "followings",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: AsyncValueWidget(
                          value: ref.watch(locationsListStreamProvider(userId)),
                          data: (locations) {
                            return StaggeredGrid.count(
                              crossAxisCount: 8,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              children: [
                                for (int i = 0; i < locations.length; i++)
                                  //each three locations will be a 2x2 grid
                                  if (i % 3 == 0) ...[
                                    AsyncValueWidget(
                                        value: ref.watch(
                                            lastGenerationForLocationStreamProvider(
                                                UserIdLocationParameter(
                                                    uid: userId,
                                                    location: locations[i]))),
                                        data: (generation) {
                                          return StaggeredGridTile.count(
                                            crossAxisCellCount: 4,
                                            mainAxisCellCount: 5,
                                            child: GestureDetector(
                                              onTap: () {
                                                GoRouter.of(context).push(
                                                    '${AppRoute.generations.route}/${generation.id!}');
                                              },
                                              child: Hero(
                                                tag: generation!.id!,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: AsyncValueWidget(
                                                        value: ref.watch(
                                                          generationImageFutureProvider(
                                                              generation.id!),
                                                        ),
                                                        data: (url) {
                                                          return Stack(
                                                            fit:
                                                                StackFit.expand,
                                                            children: [
                                                              Image.network(
                                                                url,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        12),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              32,
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 10,
                                                                              vertical: 4),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(22),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Icon(
                                                                                IconsaxPlusBold.location,
                                                                                size: 16,
                                                                              ),
                                                                              const SizedBox(width: 6),
                                                                              Text(
                                                                                "${locations[i].getCityText()}",
                                                                                maxLines: 2,
                                                                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Flexible(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                generation.prompt,
                                                                                maxLines: 3,
                                                                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                              ),
                                                                              const SizedBox(height: 6),
                                                                              Row(
                                                                                children: [
                                                                                  Text('Today', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)),
                                                                                  const SizedBox(width: 6),
                                                                                  Icon(
                                                                                    IconsaxPlusBold.sun_1,
                                                                                    size: 16,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  const SizedBox(width: 6),
                                                                                  Text('18°C', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)),
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
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          );
                                        }),
                                  ] else
                                    AsyncValueWidget(
                                        value: ref.watch(
                                            lastGenerationForLocationStreamProvider(
                                                UserIdLocationParameter(
                                                    uid: userId,
                                                    location: locations[i]))),
                                        data: (generation) {
                                          return StaggeredGridTile.count(
                                            crossAxisCellCount: 4,
                                            mainAxisCellCount: 6,
                                            child: GestureDetector(
                                              onTap: () {
                                                GoRouter.of(context).push(
                                                    '${AppRoute.generations.route}/${generation.id!}');
                                              },
                                              child: Hero(
                                                tag: generation!.id!,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: AsyncValueWidget(
                                                        value: ref.watch(
                                                          generationImageFutureProvider(
                                                              generation.id!),
                                                        ),
                                                        data: (url) {
                                                          return Stack(
                                                            fit:
                                                                StackFit.expand,
                                                            children: [
                                                              Image.network(
                                                                url,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        12),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              32,
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 10,
                                                                              vertical: 4),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(22),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Icon(
                                                                                IconsaxPlusBold.location,
                                                                                size: 16,
                                                                              ),
                                                                              const SizedBox(width: 6),
                                                                              Text(
                                                                                "${locations[i].getCityText()}",
                                                                                maxLines: 2,
                                                                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Flexible(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                generation.prompt,
                                                                                maxLines: 3,
                                                                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                              ),
                                                                              const SizedBox(height: 6),
                                                                              Row(
                                                                                children: [
                                                                                  Text('Today', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)),
                                                                                  const SizedBox(width: 6),
                                                                                  Icon(
                                                                                    IconsaxPlusBold.sun_1,
                                                                                    size: 16,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  const SizedBox(width: 6),
                                                                                  Text('18°C', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)),
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
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          );
                                        }),
                              ],
                            );
                          }),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
