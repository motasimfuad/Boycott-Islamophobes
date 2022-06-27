import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/k_card.dart';
import '../../../../core/widgets/k_image_container.dart';

class KItemCard extends StatelessWidget {
  final Object tag;
  final String name;
  final String imageUrl;
  final double? padding;
  final Function()? onTap;
  final BoxFit? imageFit;
  const KItemCard({
    Key? key,
    required this.tag,
    required this.name,
    required this.imageUrl,
    this.padding,
    this.onTap,
    this.imageFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      color: Colors.white,
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Hero(
              tag: tag,
              child: KImageContainer(
                // height: 80.h,
                imageUrl: imageUrl,
                padding: padding,
                imageFit: imageFit,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              left: 10.w,
              right: 10.w,
              bottom: 5.h,
            ),
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
