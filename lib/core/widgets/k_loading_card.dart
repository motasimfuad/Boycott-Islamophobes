import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'k_card.dart';
import 'k_shimmer.dart';

class KLoadingCard extends StatelessWidget {
  final bool? isLoading;
  final bool? showOnlyCard;
  final double? height;
  const KLoadingCard({
    Key? key,
    this.isLoading,
    this.showOnlyCard = false,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showOnlyCard == true
        ? KShimmer(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          )
        : KCard(
            color: Colors.grey.shade50,
            hasShadow: false,
            child: Column(
              children: [
                height == null
                    ? Expanded(
                        child: _buildShimmer(),
                      )
                    : SizedBox(
                        height: height,
                        child: _buildShimmer(),
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: KShimmer(
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: KShimmer(
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
                ),
              ],
            ),
          );
  }

  KShimmer _buildShimmer() {
    return KShimmer(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
