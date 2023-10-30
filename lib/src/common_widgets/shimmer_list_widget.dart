import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weatherjourney/src/common_widgets/error_message_widget.dart';
import 'package:weatherjourney/src/common_widgets/shimmer_item_widget.dart';
import 'package:weatherjourney/src/constants/app_sizes.dart';

class ShimmerListWidget<T> extends StatelessWidget {
  final AsyncValue<List<T>> value;
  final Widget? Function(BuildContext, int, List<T>) itemBuilder;
  final int? loadingItemNumber;
  final double? shimmerHeight;
  final BorderRadiusGeometry? shimmerBorderRadius;
  const ShimmerListWidget(
      {super.key,
      required this.value,
      required this.itemBuilder,
      this.loadingItemNumber,
      this.shimmerHeight,
      this.shimmerBorderRadius});

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: (elements) => ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: elements.length,
              itemBuilder: (context, index) =>
                  itemBuilder(context, index, elements),
            ),
        error: (e, st) =>
            Center(child: ErrorMessageWidget(e.toString(), st.toString())),
        loading: () => ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: loadingItemNumber ?? 10,
              itemBuilder: (context, index) {
                return ShimmerItemWidget(
                  height: shimmerHeight,
                  borderRadius: shimmerBorderRadius,
                  margin: EdgeInsets.symmetric(vertical: Sizes.p8),
                );
              },
            ));
  }
}
