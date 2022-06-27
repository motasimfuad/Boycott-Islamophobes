import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? height;
  const KAppbar({
    Key? key,
    required this.title,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 1,
      backgroundColor: Colors.black,
      centerTitle: true,
      toolbarHeight: height ?? 55.h,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 55.h);
}
