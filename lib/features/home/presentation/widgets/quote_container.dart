import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/k_card.dart';
import '../../../quote/domain/entities/quote_entity.dart';

class QuoteContainer extends StatelessWidget {
  final QuoteEntity? quote;
  const QuoteContainer({
    Key? key,
    this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 5.w,
      ),
      child: KCard(
        xPadding: 5.w,
        yPadding: 5.w,
        width: double.infinity,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/backgrounds/quote_background_brown.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quote?.quote != null ? '" ${quote?.quote} "' : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: KColors.primary.shade600,
                    ),
                  ),
                  (quote?.by != null && quote!.by.isNotEmpty)
                      ? Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Text(
                            '- ${quote?.by}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: KColors.primary.shade400,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
