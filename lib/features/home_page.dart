import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';
import '../core/router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boycott Islamophobes'),
        backgroundColor: Colors.black,
        centerTitle: true,
        toolbarHeight: 60.h,
        flexibleSpace: Container(
          // height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                KColors.primary,
                KColors.primary.shade600,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: KColors.primary.shade100,
        padding: EdgeInsets.only(
          top: 20.h,
          left: 20.w,
          right: 20.w,
          bottom: 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            KCard(
              height: 160.h,
              width: double.infinity,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Text(
                  'Blacklists',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.w),
                    gradient: LinearGradient(
                      colors: [
                        KColors.primary,
                        KColors.primary.shade600,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.h,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.w,
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return KCard(
                      onTap: () {
                        router.pushNamed(AppRouter.allProductsPage);
                      },
                    );
                  },
                ),
              ),
            ),
            // SizedBox(
            //   height: 70.h,
            // ),
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
  final Color? color;
  final bool? hasShadow;
  final Function()? onTap;
  final Widget? child;
  const KCard({
    Key? key,
    this.title,
    this.height,
    this.width,
    this.color,
    this.hasShadow = true,
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: color ?? KColors.primary.shade200,
          boxShadow: hasShadow == true
              ? [
                  BoxShadow(
                    offset: Offset(0.w, 3.h),
                    color: Colors.black26,
                    blurRadius: 2.5.w,
                    spreadRadius: 0.w,
                  )
                ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          clipBehavior: Clip.antiAlias,
          child: child ??
              Text(
                'Cat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
        ),
      ),
    );
  }
}
