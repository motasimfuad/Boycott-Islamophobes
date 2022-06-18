import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KImageContainer extends StatelessWidget {
  final String imageUrl;
  final double? height;
  const KImageContainer({
    Key? key,
    required this.imageUrl,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.r),
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
      ),
    );
  }
}
