import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KShimmer extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  const KShimmer({
    Key? key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade200,
      highlightColor: highlightColor ?? Colors.grey.shade50,
      child: child,
    );
  }
}
