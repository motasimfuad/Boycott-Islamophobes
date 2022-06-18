import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../home_page.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: KColors.primary.shade100,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 20.h,
                      bottom: 20.h,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.w,
                      ),
                      itemCount: 40,
                      itemBuilder: (BuildContext context, int index) {
                        return KCard(
                          color: Colors.white,
                          onTap: () {
                            // router.pushNamed(AppRouter.allProductsPage);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Name adfsadhs adhsfkl asd adhsfl adgfad',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                'Country',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
