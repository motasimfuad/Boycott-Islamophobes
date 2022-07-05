import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

import 'package:boycott_islamophobes/core/constants/extensions.dart';
import 'package:boycott_islamophobes/core/widgets/k_image_container.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:boycott_islamophobes/features/product/presentation/bloc/product_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/k_badge.dart';
import '../../../../core/widgets/k_loading_indicator.dart';
import '../../../../core/widgets/k_snackbar.dart';
import '../widgets/product_card_for_download.dart';
import '../widgets/product_page_notice.dart';

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
  ProductEntity? product;

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
          context.read<ProductBloc>().add(
                DownloadProductCardEvent(
                  controller: screenshotController,
                  productCard: ProductCardForDownload(
                    product: product!,
                  ),
                  product: product!,
                ),
              );
        },
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductCardDownloading ||
              state is ProductCardDownloaded) {
            kSnackBar(
              context: context,
              message: (state is ProductCardDownloading)
                  ? 'Downloading...'
                  : 'Card Downloaded for ${product?.name.toCapitalized()}',
              showSideIndicator:
                  (state is ProductCardDownloading) ? false : true,
              showProgress: (state is ProductCardDownloading) ? true : false,
              durationSeconds: 3,
              icon: (state is ProductCardDownloading)
                  ? null
                  : Icons.check_circle_outline_rounded,
            );
          }
        },
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: KLoadingIndicator(),
            );
          } else if (state is ProductLoadingError) {
            return const Center(
              child: Text('Product details not found!'),
            );
          }
          if (state is ProductLoaded) {
            product = state.product;
          } else if (state is ProductCardDownloaded) {
            product = state.product;
          }
          return buildProductDetails();
        },
      ),
    );
  }

  Widget buildProductDetails() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KImageContainer(
            imageUrl: product?.logoUrl ?? '',
            height: 250.h,
          ),
          SizedBox(height: 15.h),
          const ProductPageNotice(
            radius: 500,
          ),
          SizedBox(height: 20.h),
          Text(
            product?.name.toCapitalized() ?? '',
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
              GestureDetector(
                onTap: () {
                  router.pushNamed(
                    AppRouter.countryPage,
                    params: {RouterParams.id: product!.countryId.toString()},
                  );
                },
                child: KBadge(
                  badgeText: product?.countryName ?? 'Not specified',
                  textSize: 14.sp,
                  xPadding: 10.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          (product?.reason != null && product!.reason!.isNotEmpty)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reason:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        product?.reason ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
