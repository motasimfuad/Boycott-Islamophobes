import 'package:boycott_islamophobes/core/constants/colors.dart';
import 'package:boycott_islamophobes/core/router/app_router.dart';
import 'package:boycott_islamophobes/features/info/presentation/bloc/info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/k_snackbar.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: KColors.kBackgroundColor,
      // appBar: const KAppbar(title: ''),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 60.h,
                bottom: 40.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BlocListener<InfoBloc, InfoState>(
                        listener: (context, state) {
                          if (state is LogoDownloading) {
                            kSnackBar(
                              context: context,
                              message: 'Downloading...',
                              showSideIndicator: false,
                              showProgress: true,
                              durationSeconds: 4,
                              icon: null,
                            );
                          }
                          if (state is LogoDownloaded) {
                            kSnackBar(
                              context: context,
                              message: 'Logo Downloaded!',
                            );
                          }
                          if (state is LogoDownloadError) {
                            kSnackBar(
                              context: context,
                              message: state.message,
                            );
                          }
                        },
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 250.h),
                          child: FittedBox(
                            clipBehavior: Clip.antiAlias,
                            fit: BoxFit.contain,
                            child: GestureDetector(
                              onLongPress: () {
                                context
                                    .read<InfoBloc>()
                                    .add(DownloadHQLogoEvent());
                              },
                              child: Image.asset(
                                'assets/images/logo.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () {
                          kSnackBar(
                            context: context,
                            showIcon: false,
                            message:
                                'Long press on the image to download the HQ file.\n\nInternet connection is required.',
                          );
                        },
                        child: Icon(
                          Icons.file_download_outlined,
                          color: Colors.grey.shade300,
                          size: 22.w,
                        ),
                      ),
                      // Text(
                      //   'Long press on the image\nto download the HQ file',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontSize: 11.sp,
                      //     color: Colors.grey.shade400,
                      //     fontStyle: FontStyle.italic,
                      //   ),
                      // ),
                      SizedBox(height: 30.h),
                      Text(
                        'The app is in continuous development. More Products will be added continuously InshaAllah.\nThe app needs an active internet connection to function smoothly at this moment. We will make the app fully offline asap InshaAllah.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Keep us in your prayers.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 55.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Created with ❤️ by the Muslims',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: KColors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          const Text(
                            'for the Muslims',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: KColors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10.w,
              top: 10.w,
              child: IconButton(
                onPressed: () {
                  router.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
