// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:weatherjourney/src/localization/string_hardcoded.dart';
import 'package:weatherjourney/src/routing/app_router.dart';

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (size.width < 450) {
      return ScaffoldWithBottomNavBar(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    } else {
      return ScaffoldWithNavigationRail(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    }
  }
}

class ScaffoldWithBottomNavBar extends ConsumerWidget {
  const ScaffoldWithBottomNavBar({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //current route in gorouter
    final goRouter = ref.watch(goRouterProvider);
    return Scaffold(
      body: body,
      floatingActionButton: (goRouter.location == AppRoute.locations.route)
          ? FloatingActionButton(
              onPressed: () {
                context.pushNamed(AppRoute.locationCreate.name);
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            onTap: onDestinationSelected,
            currentIndex: currentIndex,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(IconsaxPlusLinear.flash_circle,
                    size: 28,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor),
                activeIcon: Icon(IconsaxPlusBold.flash_circle,
                    size: 28,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor),
                label: 'Home',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: Icon(IconsaxPlusLinear.sun_1,
                    size: 28,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor),
                activeIcon: Icon(IconsaxPlusBold.sun_1,
                    size: 28,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor),
                label: 'Weather',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: Icon(IconsaxPlusLinear.location,
                    size: 28,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor),
                activeIcon: Icon(IconsaxPlusBold.location,
                    size: 28,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor),
                label: 'Locations',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                icon: Icon(IconsaxPlusLinear.profile,
                    size: 28,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor),
                activeIcon: Icon(IconsaxPlusBold.profile,
                    size: 28,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor),
                label: 'Account',
                backgroundColor: Colors.transparent,
              ),
            ]),
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: const Icon(Icons.work_outline),
                selectedIcon: const Icon(Icons.work),
                label: Text('Jobs'.hardcoded),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.view_headline_outlined),
                selectedIcon: const Icon(Icons.view_headline),
                label: Text('Entries'.hardcoded),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person),
                label: Text('Account'.hardcoded),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
