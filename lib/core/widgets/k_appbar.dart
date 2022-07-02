import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? height;
  final double? elevation;
  final Widget? content;
  final Color? color;
  final IconData? actionBtn;
  final Function()? onActionPress;
  const KAppbar({
    Key? key,
    required this.title,
    this.height,
    this.elevation,
    this.content,
    this.color,
    this.actionBtn,
    this.onActionPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: content != null
          ? Container(
              child: content,
            )
          : Text(title),
      elevation: elevation ?? 1,
      backgroundColor: color ?? Colors.black,
      centerTitle: true,
      toolbarHeight: height ?? 55.h,
      actions: [
        actionBtn != null
            ? IconButton(
                onPressed: onActionPress,
                icon: Icon(actionBtn),
                padding: EdgeInsets.only(right: 20.w),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 55.h);
}
