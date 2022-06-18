import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KShimmer extends StatelessWidget {
  final Widget child;
  const KShimmer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade50,
      child: child,
    );
  }
}
