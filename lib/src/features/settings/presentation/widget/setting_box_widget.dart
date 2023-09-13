import 'package:flutter/material.dart';
import 'package:weatherjourney/src/constants/app_sizes.dart';

class SettingBoxWidget extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget child;
  const SettingBoxWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Sizes.p24, right: Sizes.p24, top: Sizes.p24),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p16, vertical: Sizes.p24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      const SizedBox(height: Sizes.p8),
                      subtitle,
                      const SizedBox(height: Sizes.p16),
                      Expanded(child: child),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
