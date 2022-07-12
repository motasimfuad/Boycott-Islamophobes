import 'package:boycott_islamophobes/core/widgets/k_appbar.dart';
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
import '../../../../core/widgets/k_loading_indicator.dart';
import '../../../../core/widgets/k_snackbar.dart';
import '../widgets/product_card_for_download.dart';
import '../widgets/product_information_container.dart';
import '../widgets/product_information_item.dart';
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
      appBar: const KAppbar(title: 'Boycott this product'),
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
            child: KImageContainer(
              imageUrl: product?.logoUrl ?? '',
              height: 220.h,
            ),
          ),
          SizedBox(height: 15.h),
          const ProductPageNotice(
            radius: 500,
          ),
          SizedBox(height: 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product?.name.toCapitalized() ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ProductInformationContainer(
            product: product,
            items: [
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
              ProductInformationItem(
                itemTitle: 'Company',
                itemValue: product?.companyName,
                onTap: () {},
                isVisible: (product?.companyName != null &&
                    product!.companyName!.isNotEmpty),
              ),
              ProductInformationItem(
                itemTitle: 'Category',
                itemValue: product?.categoryName,
                isVisible: (product?.categoryName != null &&
                    product!.categoryName.isNotEmpty),
                onTap: () {
                  router.pushNamed(
                    AppRouter.categoryPage,
                    params: {RouterParams.id: '${product?.categoryId}'},
                  );
                },
              ),
              ProductInformationItem(
                itemTitle: 'Reason',
                showOnlyValue: true,
                itemValue: product?.reason,
                isVisible:
                    (product?.reason != null && product!.reason!.isNotEmpty),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
