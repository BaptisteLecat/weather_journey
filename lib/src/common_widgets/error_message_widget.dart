import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, this.stackTrace, {super.key});
  final String errorMessage;
  final String? stackTrace;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          errorMessage,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.red),
        ),
        if (stackTrace != null)
          Text(
            stackTrace!,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.red),
          ),
      ],
    );
  }
}
