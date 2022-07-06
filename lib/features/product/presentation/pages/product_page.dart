import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

import 'package:boycott_islamophobes/core/constants/extensions.dart';
import 'package:boycott_islamophobes/core/widgets/k_card.dart';
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
      backgroundColor: KColors.kBackgroundColor,
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
      padding: EdgeInsets.only(
        top: 20.w,
        left: 20.w,
        right: 20.w,
        bottom: 80.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KCard(
            borderWidth: 0,
            hasBorder: false,
            color: Colors.white,
            // hasShadow: false,
            child: KImageContainer(
              imageUrl: product?.logoUrl ?? '',
              height: 230.h,
            ),
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
          // Row(
          //   children: [
          //     Text(
          //       'Country:',
          //       textAlign: TextAlign.start,
          //       style: TextStyle(
          //         fontSize: 18.sp,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //     SizedBox(width: 8.w),
          //     GestureDetector(
          //       onTap: () {
          //         router.pushNamed(
          //           AppRouter.countryPage,
          //           params: {RouterParams.id: product!.countryId.toString()},
          //         );
          //       },
          //       child: KBadge(
          //         badgeText: product?.countryName ?? 'Not specified',
          //         textSize: 14.sp,
          //         xPadding: 10.w,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 15.h),
          // Row(
          //   children: [
          //     Text(
          //       'Company:',
          //       textAlign: TextAlign.start,
          //       style: TextStyle(
          //         fontSize: 18.sp,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //     SizedBox(width: 8.w),
          //     GestureDetector(
          //       child: KBadge(
          //         badgeText: (product?.companyName != null &&
          //                 product!.companyName!.isNotEmpty)
          //             ? product?.companyName
          //             : 'Not specified',
          //         textSize: 14.sp,
          //         xPadding: 10.w,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 20.h),
          ProductInformationContainer(product: product),
        ],
      ),
    );
  }
}

class ProductInformationContainer extends StatelessWidget {
  final ProductEntity? product;
  const ProductInformationContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      color: Colors.white,
      xPadding: 0,
      yPadding: 0,
      radius: 20.r,
      child: Container(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          top: 12.w,
        ),
        child: Column(
          children: [
            ProductInformationItem(
              itemTitle: 'Country',
              itemValue: product?.countryName,
              onTap: () {
                router.pushNamed(
                  AppRouter.countryPage,
                  params: {RouterParams.id: product!.countryId.toString()},
                );
              },
            ),
            (product?.companyName != null && product!.companyName!.isNotEmpty)
                ? ProductInformationItem(
                    itemTitle: 'Company',
                    itemValue: product?.companyName,
                    onTap: () {},
                  )
                : const SizedBox(),
            (product?.categoryName != null && product!.categoryName.isNotEmpty)
                ? ProductInformationItem(
                    itemTitle: 'Category',
                    itemValue: product?.categoryName,
                    onTap: () {
                      router.pushNamed(
                        AppRouter.categoryPage,
                        params: {RouterParams.id: '${product?.categoryId}'},
                      );
                    },
                  )
                : const SizedBox(),
            (product?.reason != null && product!.reason!.isNotEmpty)
                ? ProductInformationItem(
                    itemTitle: 'Reason',
                    showOnlyValue: true,
                    itemValue: product?.reason,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ProductInformationItem extends StatelessWidget {
  final Function()? onTap;
  final String itemTitle;
  final String? itemValue;
  final bool? showOnlyValue;
  final double? btmPadding;
  const ProductInformationItem({
    Key? key,
    this.onTap,
    required this.itemTitle,
    this.itemValue,
    this.showOnlyValue = false,
    this.btmPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: btmPadding ?? 12.w),
      child: KCard(
        color: Colors.grey.shade100,
        xPadding: 12.h,
        yPadding: 10.h,
        hasShadow: false,
        radius: 20.r,
        child: showOnlyValue == true
            ? Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        itemValue ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$itemTitle:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: onTap,
                    child: KBadge(
                      badgeText: itemValue ?? 'Not specified',
                      textSize: 14.sp,
                      xPadding: 10.w,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
