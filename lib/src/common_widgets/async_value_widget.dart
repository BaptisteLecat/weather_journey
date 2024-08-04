import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/common_widgets/error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {super.key,
      required this.value,
      required this.data,
      this.skipLoadingOnRefresh = false});

  final AsyncValue<T> value;
  final Widget Function(T) data;
  final bool skipLoadingOnRefresh;

  @override
  Widget build(BuildContext context) {
    return value.when(
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      data: data,
      error: (e, st) =>
          Center(child: ErrorMessageWidget(e.toString(), st.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
