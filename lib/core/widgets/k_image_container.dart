// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:boycott_islamophobes/core/constants/colors.dart';

class KImageContainer extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? radius;
  final double? padding;
  final String? fallBackText;
  final bool? hasBorder;
  final BoxFit? imageFit;
  final Color? borderClr;
  const KImageContainer({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.radius,
    this.padding,
    this.fallBackText,
    this.hasBorder = false,
    this.imageFit,
    this.borderClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(radius ?? 20.r),
      child: Container(
        height: height ?? 100.h,
        padding: EdgeInsets.all(padding ?? 15.w),
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(radius ?? 20.r),
          border: hasBorder == true
              ? Border.all(
                  color: borderClr ?? KColors.primary,
                  width: 2,
                )
              : Border.all(
                  color: borderClr ?? Colors.grey.shade100,
                  width: 0,
                ),
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                scale: 1.0,
                fit: imageFit ?? BoxFit.contain,
              ),
            ),
          ),
          placeholder: (context, url) => const Center(
            child: CupertinoActivityIndicator(),
          ),
          errorWidget: (context, url, error) {
            return Center(
              child: Text(
                fallBackText ?? 'Image not loaded!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
