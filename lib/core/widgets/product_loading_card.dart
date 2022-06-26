import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'k_card.dart';
import 'k_shimmer.dart';

class KLoadingCard extends StatelessWidget {
  final bool? isLoading;
  const KLoadingCard({
    Key? key,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      color: Colors.grey.shade50,
      hasShadow: false,
      child: Column(
        children: [
          KShimmer(
            child: Container(
              // height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          KShimmer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KCard(
                  hasShadow: false,
                  height: 20.h,
                  width: 60.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          KShimmer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KCard(
                  hasShadow: false,
                  height: 20.h,
                  width: 70.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}