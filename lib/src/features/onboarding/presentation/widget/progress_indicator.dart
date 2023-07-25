import 'package:flutter/material.dart';

class ProgressIndicatorDot extends StatelessWidget {
  final bool isActive;
  const ProgressIndicatorDot({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: (isActive) ? 32 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: (isActive) ? BorderRadius.circular(16) : null,
          shape: (!isActive) ? BoxShape.circle : BoxShape.rectangle,
          color: (isActive)
              ? Theme.of(context).primaryColor
              : Theme.of(context).disabledColor),
    );
  }
}
