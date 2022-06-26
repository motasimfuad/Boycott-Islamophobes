import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:boycott_islamophobes/core/widgets/product_loading_card.dart';

/// isLoading is Handled
class KGrid extends StatelessWidget {
  final bool? isLoading;
  final List<dynamic> items;
  final Widget Function(BuildContext, int) itemBuilder;
  final int crossAxisCount;
  final double? childAspectRatio;
  const KGrid({
    Key? key,
    this.isLoading = false,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.childAspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: 20.h,
      ),
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio ?? 0.8.h,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.w,
      ),
      itemCount: isLoading == true ? 5 : items.length,
      itemBuilder: isLoading == true
          ? (BuildContext context, int index) {
              return const KLoadingCard();
            }
          : itemBuilder,
    );
  }
}
