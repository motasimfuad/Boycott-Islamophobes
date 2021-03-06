import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:boycott_islamophobes/core/widgets/k_loading_card.dart';

/// isLoading is Handled
class KGrid extends StatelessWidget {
  final bool? isLoading;
  final bool? showOnlyCard;
  final List<dynamic> items;
  final Widget Function(BuildContext, int) itemBuilder;
  final int crossAxisCount;
  final int? loadingItems;
  final double? childAspectRatio;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  const KGrid({
    Key? key,
    this.isLoading = false,
    this.showOnlyCard,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.loadingItems,
    this.childAspectRatio,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.only(
        left: leftPadding ?? 20.w,
        right: rightPadding ?? 20.w,
        top: topPadding ?? 20.h,
        bottom: bottomPadding ?? 20.h,
      ),
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio?.w ?? 0.8.w,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.w,
      ),
      itemCount: (isLoading == true) ? (loadingItems ?? 5) : items.length,
      itemBuilder: isLoading == true
          ? (BuildContext context, int index) {
              return KLoadingCard(
                showOnlyCard: showOnlyCard,
              );
            }
          : itemBuilder,
    );
  }
}
