import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:weatherjourney/src/common_widgets/async_value_widget.dart';
import 'package:weatherjourney/src/features/feed/data/firestore/root_generation_firestore_repository.dart';
import 'package:weatherjourney/src/features/feed/domain/root_generation/root_generation.dart';
import 'package:weatherjourney/src/features/feed/presentation/controller/root_generation_like_controller.dart';
import 'package:weatherjourney/src/features/user/data/firestore/user_firestore_repository.dart';

class GenerationScreen extends ConsumerWidget {
  final String generationId;
  const GenerationScreen({
    super.key,
    required this.generationId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AsyncValueWidget<RootGeneration?>(
        value: ref.watch(rootGenerationFetchOneStreamProvider(generationId)),
        data: (rootGeneration) {
          return CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  minHeight: MediaQuery.of(context).size.height * 0.4,
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                  child: Hero(
                    tag: rootGeneration!.id,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            rootGeneration.generation.generatedImage!.uri,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SafeArea(
                              child: SizedBox(
                                height: 46,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        GoRouter.of(context).pop();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        child: Center(
                                            child: Icon(Icons.arrow_back)),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          padding: const EdgeInsets.all(12),
                                          child: Icon(Icons.gps_fixed_outlined),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            ref
                                                .read(
                                                    rootGenerationLikeControllerProvider
                                                        .notifier)
                                                .likeRootGeneration(
                                                    rootGeneration:
                                                        rootGeneration);
                                            ref.invalidate(
                                                userfetchOneFutureProvider);
                                          },
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minWidth: 78,
                                            ),
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 4),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        IconsaxPlusBold.heart,
                                                        color: Colors.red,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "${rootGeneration.likes != null ? rootGeneration.likes!.length : 0}",
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
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 42,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconsaxPlusBold.location,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        "${rootGeneration.location.getCityText()}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                pinned: true,
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  minHeight: 80,
                  maxHeight: 80,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AsyncValueWidget(
                        skipLoadingOnRefresh: true,
                        value: ref.watch(
                            userfetchOneFutureProvider(rootGeneration.user.id)),
                        data: (user) {
                          print(user);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 54,
                                      width: 54,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (user?.avatar == null)
                                            ? Colors.white
                                            : null,
                                        image: (user?.avatar != null)
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    "${user?.avatar}"),
                                                fit: BoxFit.cover,
                                              )
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${user?.firstname} ${user?.lastname}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.star,
                                                      color: Colors.yellow),
                                                  Text(
                                                    '3 221',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: 1,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.favorite,
                                                      color: Colors.red),
                                                  Text(
                                                    "${user?.likes?.length ?? 0}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                child: Center(
                                  child: Text(
                                    "Follow",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text("${rootGeneration.generation.prompt}"),
                    ],
                  ),
                ),
              ),
              // Ajoutez plus de SliverToBoxAdapter widgets ici pour le contenu additionnel
            ],
          );
        },
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
