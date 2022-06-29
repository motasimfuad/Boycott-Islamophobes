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
      appBar: const KAppbar(title: 'FAQ'),
      body: SingleChildScrollView(
        primary: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
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
              // headerTextStyle: const TextStyle(
              //   color: Colors.white,
              //   fontSize: 17,
              //   fontWeight: FontWeight.bold,
              // ),
              // leftIcon: const Icon(Icons.question_mark_rounded, color: Colors.white),
              children:
                  // [
                  List.generate(
                15,
                (index) => _buildAccordionSection(
                  question:
                      'Instance "ListController" with tag "279662130" has been initial adfiz',
                  answer: 'answer 1',
                ),
              ),
              // AccordionSection(
              //   header: const Text(
              //     'About Us',
              //     style: TextStyle(color: Colors.white, fontSize: 17),
              //   ),
              //   content: Icon(Icons.airline_seat_flat,
              //       size: 120, color: Colors.blue[200]),
              // ),
              // AccordionSection(
              //   header: const Text('Company Info',
              //       style: TextStyle(color: Colors.white, fontSize: 17)),
              //   content: Icon(Icons.airplay, size: 70, color: Colors.green[200]),
              // ),
              // ],
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
      // rightIcon: const Icon(
      //   Icons.access_alarm_outlined,
      // ),
      scrollIntoViewOfItems: ScrollIntoViewOfItems.fast,
      contentBorderRadius: 20.w,
      contentHorizontalPadding: 20.w,
      contentVerticalPadding: 15.w,
      paddingBetweenOpenSections: 15.h,
      paddingBetweenClosedSections: 15.h,
    );
  }
}
