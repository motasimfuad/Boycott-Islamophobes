import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/k_card.dart';
import '../../../../core/widgets/k_shimmer.dart';

class FaqLoadingList extends StatelessWidget {
  const FaqLoadingList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 20.h),
      shrinkWrap: true,
      primary: false,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return KShimmer(
          baseColor: KColors.primary.shade600,
          highlightColor: KColors.primary.shade400,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 15.h,
            ),
            child: KCard(
              hasShadow: false,
              height: 55.h,
              radius: 20.r,
            ),
          ),
        );
      },
    );
  }
}
