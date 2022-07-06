import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/k_card.dart';

class FaqNotice extends StatelessWidget {
  const FaqNotice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      xPadding: 5.w,
      yPadding: 5.w,
      width: double.infinity,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.w,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/quote_background_brown.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assalamu Alaikum wa Rahmatullah!',
              style: TextStyle(
                color: KColors.primaryDark,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Dear brothers and sisters, Jazakallahu Khairan for taking part in the movement of boycotting those who oppose our Deen and dare to defame Rasulullah (ﷺ). \nMay Allah accept all of our efforts and keep us in the straight path till our last breath.',
              style: TextStyle(
                color: KColors.primaryDark,
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Fidaka nafsi wa abi wa ummi Ya Rasulullah (sallalahu alaihi wa sallam)',
              style: TextStyle(
                color: KColors.primaryDark,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Here we have answered some of the frequently asked questions.',
              style: TextStyle(
                color: KColors.primaryDark,
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
