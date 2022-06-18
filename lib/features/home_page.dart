import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';
import '../core/router/app_router.dart';
import '../core/widgets/k_card.dart';

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
