import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:boycott_islamophobes/core/widgets/k_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primary.shade100,
      appBar: const KAppbar(title: 'FAQs'),
      body: SingleChildScrollView(
        primary: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assalamu Alaikum wa Rahmatullah!',
                    style: TextStyle(
                      color: KColors.primary.shade800,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Dear brothers and sisters, Jazakallahu Khairan for taking part in the movement of boycotting those who defame out Deen and dare to belittle Rasulullah (ﷺ).\n\nHere we have answered some of the frequently asked questions.',
                    style: TextStyle(
                      color: KColors.primary.shade800,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Accordion(
              paddingListHorizontal: 20.w,
              paddingListBottom: 80.h,
              maxOpenSections: 1,
              headerPadding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 15.h,
              ),
              headerBorderRadius: 20.w,
              disableScrolling: true,
              children: List.generate(
                15,
                (index) => _buildAccordionSection(
                  question:
                      'Instance "ListController" with tag "279662130" has been initial adfiz',
                  answer: 'answer 1',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AccordionSection _buildAccordionSection({
    required final String question,
    required final String answer,
  }) {
    return AccordionSection(
      header: Text(
        question,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
        ),
      ),
      content: Row(
        children: [
          Text(
            answer,
          ),
        ],
      ),
      scrollIntoViewOfItems: ScrollIntoViewOfItems.fast,
      contentBorderRadius: 20.w,
      contentHorizontalPadding: 20.w,
      contentVerticalPadding: 15.w,
      paddingBetweenOpenSections: 10.h,
      paddingBetweenClosedSections: 10.h,
    );
  }
}
