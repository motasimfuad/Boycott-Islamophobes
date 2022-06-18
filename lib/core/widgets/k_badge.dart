import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KBadge extends StatelessWidget {
  final Widget? badgeContent;
  final String? badgeText;
  final double? textSize;
  final double? xPadding;
  final double? yPadding;
  const KBadge({
    Key? key,
    this.badgeContent,
    this.badgeText,
    this.textSize,
    this.xPadding,
    this.yPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      toAnimate: false,
      elevation: 0,
      shape: BadgeShape.square,
      badgeColor: Colors.black,
      borderRadius: BorderRadius.circular(15.r),
      padding: EdgeInsets.symmetric(
        horizontal: xPadding ?? 8.w,
        vertical: yPadding ?? 5.h,
      ),
      badgeContent: badgeContent ??
          Text(
            badgeText ?? '',
            style: TextStyle(
              fontSize: textSize ?? 10.sp,
              color: Colors.white,
            ),
          ),
    );
  }
}
