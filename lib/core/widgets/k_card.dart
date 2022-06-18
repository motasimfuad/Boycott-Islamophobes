import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class KCard extends StatelessWidget {
  final String? title;
  final double? height;
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
        padding: EdgeInsets.symmetric(
          vertical: yPadding ?? 12.h,
          horizontal: xPadding ?? 12.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
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
          borderRadius: BorderRadius.circular(20.r),
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
