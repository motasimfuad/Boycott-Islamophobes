import 'package:boycott_islamophobes/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class KLoadingIndicator extends StatelessWidget {
  const KLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: KColors.primary,
      size: 30.w,
    );
  }
}
