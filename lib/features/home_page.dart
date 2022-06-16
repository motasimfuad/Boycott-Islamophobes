import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boycott Islamophobes'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: KColors.primary.shade50,
        padding: EdgeInsets.only(
          top: 15.h,
          left: 15.w,
          right: 15.w,
          bottom: 15.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            KCard(
              height: 200.h,
              width: double.infinity,
            ),
            SizedBox(
              height: 20.h,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return const KCard();
                },
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}

class KCard extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  const KCard({
    Key? key,
    this.title,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: KColors.primary,
      ),
      child: Text('Cat',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          )),
    );
  }
}
