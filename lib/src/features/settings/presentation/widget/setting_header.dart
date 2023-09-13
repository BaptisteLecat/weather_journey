import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherjourney/src/constants/app_sizes.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
