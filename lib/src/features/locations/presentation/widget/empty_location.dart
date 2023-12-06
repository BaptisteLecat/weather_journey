import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherjourney/src/routing/app_router.dart';

class EmptyLocation extends StatelessWidget {
  const EmptyLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 48,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          Column(
            children: [
              Image.asset(
                'assets/icons/location.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 28),
              const Text(
                'You have no locations yet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.pushNamed(AppRoute.locations.name);
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Add a location',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
