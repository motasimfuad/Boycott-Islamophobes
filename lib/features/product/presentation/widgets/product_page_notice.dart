import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/k_card.dart';

class ProductPageNotice extends StatelessWidget {
  final String? title;
  final double? radius;
  const ProductPageNotice({
    Key? key,
    this.title,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      width: double.infinity,
      hasShadow: false,
      color: Colors.black,
      xPadding: 20.w,
      yPadding: 12.h,
      radius: radius ?? 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? 'Boycott this product',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.not_interested_rounded,
            color: Colors.red,
            size: 22.w,
          ),
        ],
      ),
    );
  }
}
