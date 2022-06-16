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
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                color: Colors.amber,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 200.h,
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.black,
                                height: 100,
                                width: double.infinity,
                                child: const Text('Cat'),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.black,
                                height: 100,
                                width: double.infinity,
                                child: const Text('Cat'),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.black,
                                height: 100,
                                width: double.infinity,
                                child: const Text('Cat'),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.black,
                                height: 100,
                                width: double.infinity,
                                child: const Text('Cat'),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    // Flexible(
                    //   fit: FlexFit.tight,
                    //   child: Container(
                    //     color: Colors.blue,
                    //     child: GridView.builder(
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       gridDelegate:
                    //           const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2,
                    //         childAspectRatio: 1,
                    //         crossAxisSpacing: 10,
                    //         mainAxisSpacing: 10,
                    //       ),
                    //       itemCount: 4,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return Expanded(
                    //           child: Container(
                    //             color: Colors.black,
                    //             height: double.infinity,
                    //             child: const Text('Cat'),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 100.h,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
