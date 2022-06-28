import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

kSnackbarFlat({
  required BuildContext context,
  required String? message,
  Color? bgColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 700),
      backgroundColor: bgColor ?? KColors.primary,
      content: Text(message ?? ''),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10.w),
    ),
  );
}
