import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/k_badge.dart';
import '../../../../core/widgets/k_card.dart';

class ProductInformationItem extends StatelessWidget {
  final Function()? onTap;
  final String itemTitle;
  final String? itemValue;
  final bool? showOnlyValue;
  final double? btmPadding;
  final bool? isVisible;
  const ProductInformationItem({
    Key? key,
    this.onTap,
    required this.itemTitle,
    this.itemValue,
    this.showOnlyValue = false,
    this.btmPadding,
    this.isVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isVisible == true
        ? Padding(
            padding: EdgeInsets.only(bottom: btmPadding ?? 12.w),
            child: KCard(
              color: Colors.grey.shade100,
              xPadding: 12.h,
              yPadding: 10.h,
              hasShadow: false,
              radius: 20.r,
              child: showOnlyValue == true
                  ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              itemValue ?? '',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$itemTitle:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: onTap,
                          child: KBadge(
                            badgeText: itemValue ?? 'Not specified',
                            textSize: 14.sp,
                            xPadding: 10.w,
                          ),
                        ),
                      ],
                    ),
            ),
          )
        : const SizedBox();
  }
}
