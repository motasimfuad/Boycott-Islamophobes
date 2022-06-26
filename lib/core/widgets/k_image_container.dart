import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:boycott_islamophobes/core/constants/colors.dart';

class KImageContainer extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? radius;
  final String? fallBackText;
  final bool? hasBorder;
  const KImageContainer({
    Key? key,
    required this.imageUrl,
    this.height,
    this.radius,
    this.fallBackText,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100.h,
      padding: EdgeInsets.all(10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(radius ?? 20.r),
        border: hasBorder == true
            ? Border.all(
                color: KColors.primary,
                width: 2,
              )
            : Border.all(
                color: Colors.grey.shade100,
              ),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
        errorBuilder: (context, exception, stack) {
          return Center(
              child: Text(
            fallBackText ?? 'Image not loaded!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
            ),
          ));
        },
      ),
    );
  }
}
