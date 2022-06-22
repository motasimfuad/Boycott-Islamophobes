import 'package:boycott_islamophobes/core/widgets/k_image_container.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:boycott_islamophobes/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/k_badge.dart';
import '../../../../core/widgets/k_card.dart';

class ProductPage extends StatefulWidget {
  final int productId;
  const ProductPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ScreenshotController screenshotController = ScreenshotController();
  late ProductEntity product;

  @override
  void initState() {
    context.read<ProductBloc>().add(
          GetProductEvent(productId: widget.productId),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primary.shade100,
      appBar: AppBar(
        title: const Text('Boycott this product'),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        label: Row(
          children: const [
            Icon(Icons.download_rounded),
            SizedBox(width: 8),
            Text('Product Card'),
          ],
        ),
        onPressed: () async {
          //   await screenshotController
          //       .capture(delay: const Duration(milliseconds: 10))
          //       .then((Uint8List image) async {
          //     final directory = await getApplicationDocumentsDirectory();
          //     final imagePath =
          //         await File('${directory.path}/image.png').create();
          //     await imagePath.writeAsBytes(image);

          //     /// Share Plugin
          //     await Share.shareFiles([imagePath.path]);
          //   });
        },
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            product = state.product;

            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Screenshot(
                    controller: screenshotController,
                    child: Hero(
                      tag: product.id,
                      child: KImageContainer(
                        imageUrl: product.logoUrl,
                        height: 300.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  KCard(
                    width: double.infinity,
                    hasShadow: false,
                    color: Colors.black,
                    xPadding: 20.w,
                    yPadding: 12.h,
                    title: 'Boycott this product',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Boycott this product',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                        Icon(
                          Icons.not_interested_rounded,
                          color: Colors.white,
                          size: 22.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    product.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(
                        'Country:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      KBadge(
                        badgeText: product.countryName ?? 'Not specified',
                        textSize: 14.sp,
                        xPadding: 10.w,
                      ),
                    ],
                  )
                ],
              ),
            );
          } else if (state is ProductLoadingError) {
            return const Center(
              child: Text('Product details not found!'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
