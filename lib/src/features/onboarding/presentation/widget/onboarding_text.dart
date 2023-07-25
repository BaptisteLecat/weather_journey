import 'package:flutter/material.dart';

class OnboardingText extends StatelessWidget {
  final String title;
  final String description;
  const OnboardingText(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 16,
              ),
              Text(description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16)),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
