import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? height;
  final double? elevation;
  final Widget? content;
  final Color? color;
  const KAppbar({
    Key? key,
    required this.title,
    this.height,
    this.elevation,
    this.content,
    this.color,
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
      // leading: router.navigator == null
      //     ? null
      //     : GestureDetector(
      //         onTap: () {
      //           router.pop();
      //         },
      //         child: Icon(
      //           Icons.arrow_back_ios_rounded,
      //           size: 20.h,
      //         ),
      //       ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.signal_wifi_off_rounded),
          iconSize: 18.h,
          tooltip: 'Internet Connection Status',
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 55.h);
}
