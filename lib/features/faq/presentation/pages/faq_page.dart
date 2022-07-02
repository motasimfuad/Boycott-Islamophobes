import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:boycott_islamophobes/core/router/app_router.dart';
import 'package:boycott_islamophobes/core/widgets/k_appbar.dart';
import 'package:boycott_islamophobes/core/widgets/k_card.dart';
import 'package:boycott_islamophobes/core/widgets/k_shimmer.dart';
import 'package:boycott_islamophobes/features/faq/domain/entities/faq_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../bloc/faq_bloc.dart';
import '../widgets/faq_notice.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<FaqEntity> faqs = [];

  @override
  void initState() {
    context.read<FaqBloc>().add(GetAllFaqsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primary.shade100,
      appBar: KAppbar(
        title: 'FAQs',
        actionBtn: Icons.info_outline_rounded,
        onActionPress: () {
          router.pushNamed(AppRouter.infoPage);
        },
      ),
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
              child: const FaqNotice(),
            ),
            BlocBuilder<FaqBloc, FaqState>(
              builder: (context, state) {
                if (state is FaqListLoading) {
                  return const FaqLoadingList();
                }
                if (state is FaqListLoaded) {
                  faqs = state.faqs;
                }
                return Accordion(
                  paddingListHorizontal: 20.w,
                  paddingListBottom: 80.h,
                  maxOpenSections: 1,
                  headerPadding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 15.h,
                  ),
                  scrollIntoViewOfItems: ScrollIntoViewOfItems.fast,
                  headerBorderRadius: 20.w,
                  disableScrolling: true,
                  children: faqs.map((faq) {
                    return _buildAccordionSection(
                      question: faq.question,
                      answer: faq.answer,
                    );
                  }).toList(),
                );
              },
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
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return KShimmer(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 15.h,
            ),
            child: KCard(
              hasShadow: false,
              height: 60.h,
              radius: 20.r,
            ),
          ),
        );
      },
    );
  }
}
