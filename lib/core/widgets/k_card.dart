import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class KCard extends StatelessWidget {
  final String? title;
  final double? height;
  final double? minHeight;
  final double? maxHeight;
  final double? width;
  final double? xPadding;
  final double? yPadding;
  final Color? color;
  final bool? hasShadow;
  final Function()? onTap;
  final Widget? child;
  const KCard({
    Key? key,
    this.title,
    this.height,
    this.minHeight,
    this.maxHeight,
    this.width,
    this.xPadding,
    this.yPadding,
    this.color,
    this.hasShadow = true,
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        constraints: BoxConstraints(
          minHeight: minHeight ?? 0.0,
          maxHeight: maxHeight ?? double.infinity,
        ),
        padding: EdgeInsets.symmetric(
          vertical: yPadding ?? 8.w,
          horizontal: xPadding ?? 8.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.r),
          color: color ?? KColors.primary.shade200,
          boxShadow: hasShadow == true
              ? [
                  BoxShadow(
                    offset: Offset(0.w, 3.h),
                    color: Colors.black26,
                    blurRadius: 2.5.w,
                    spreadRadius: 0.w,
                  )
                ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18.r),
          clipBehavior: Clip.antiAlias,
          child: child ??
              Text(
                title ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
        ),
      ),
    );
  }
}
