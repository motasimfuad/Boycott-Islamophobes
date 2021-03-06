import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/k_card.dart';

class HomePageCard extends StatelessWidget {
  final String? title;
  final String? totalItems;
  final String imageName;
  final Function()? onTap;
  const HomePageCard({
    Key? key,
    this.title,
    this.totalItems,
    required this.imageName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: KCard(
        xPadding: 12.w,
        yPadding: 12.w,
        onTap: onTap,
        color: KColors.primary.shade50,

        // hasBorder: true,
        borderColor: KColors.kBackgroundColor,
        borderWidth: 2,
        child: Container(
          constraints: BoxConstraints(minHeight: 140.h),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 5.w,
            horizontal: 5.w,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrounds/background_hand.png'),
              alignment: Alignment.bottomRight,
              scale: 1,
              opacity: 0.1,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40.w,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.w,
                    ),
                    child: Image.asset(imageName),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    title ?? '',
                    maxLines: 2,
                    style: TextStyle(
                      color: KColors.secondary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                '${totalItems ?? 0} listed',
                style: TextStyle(
                  color: KColors.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
