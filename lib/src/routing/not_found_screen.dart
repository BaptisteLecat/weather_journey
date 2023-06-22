import 'package:flutter/material.dart';
import 'package:weather_assistant/src/localization/string_hardcoded.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '404 - Page not found!'.hardcoded,
        ),
      ),
    );
  }
}
