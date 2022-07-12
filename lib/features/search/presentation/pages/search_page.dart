import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:boycott_islamophobes/core/constants/colors.dart';
import 'package:boycott_islamophobes/core/router/app_router.dart';
import 'package:boycott_islamophobes/core/widgets/k_appbar.dart';
import 'package:boycott_islamophobes/core/widgets/k_grid.dart';
import 'package:boycott_islamophobes/core/widgets/k_snackbar.dart';
import 'package:boycott_islamophobes/core/widgets/k_text_field.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:boycott_islamophobes/features/product/presentation/widgets/product_card.dart';

import '../../../../core/widgets/k_loading_indicator.dart';
import '../../../product/presentation/bloc/product_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode(canRequestFocus: false);
  List<ProductEntity> products = [];
  String? searchText;
  bool cleared = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.kBackgroundColor,
      appBar: const KAppbar(
        title: 'Search Product',
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is FilteredProductListLoaded) {
            products.clear();
            products = state.products;

            kSnackBar(
              context: context,
              message:
                  '${products.length} blacklisted items found for " $searchText "',
              position: FlashPosition.top,
              durationSeconds: 4,
            );
          }
          if (state is FilteredProductListLoading) {
            searchText = searchController.text;
            searchController.clear();
          }
        },
        builder: (context, state) {
          if (state is FilteredProductListLoading) {
            return const Center(
              child: KLoadingIndicator(),
            );
          }

          return Padding(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            child: Container(
              color: KColors.kBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: KTextField(
                      hintText: 'product name...',
                      focusNode: searchFocusNode,
                      controller: searchController,
                      autofocus: true,
                      suffixIcon: Icons.search_rounded,
                      textInputAction: TextInputAction.search,
                      onSuffixTap: () {
                        _getSearchResult(context);
                      },
                      onSubmitted: (val) {
                        _getSearchResult(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ((state is FilteredProductListLoaded ||
                              state is ProductLoaded ||
                              state is ProductCardDownloaded) &&
                          products.isNotEmpty)
                      ? Container(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            right: 25.w,
                            bottom: 5.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Boycott these products',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17.sp,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Chip(
                                label: Text('$searchText'),
                                deleteButtonTooltipMessage: 'Delete?',
                                deleteIconColor: KColors.primaryDark,
                                backgroundColor: KColors.kBackgroundColorDarker,
                                deleteIcon: const Icon(Icons.cancel_rounded),
                                onDeleted: () {
                                  setState(() {
                                    products.clear();
                                    cleared = true;
                                  });
                                },
                                visualDensity: VisualDensity.compact,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  if (state is! FilteredProductListLoaded && products.isEmpty)
                    TextFeedbackContainer(
                      text: 'Check if the product is blacklisted!',
                      containerTap: () {
                        searchFocusNode.unfocus();
                      },
                    )
                  else if (state is FilteredProductListLoaded &&
                      products.isEmpty &&
                      cleared == false)
                    TextFeedbackContainer(
                      text: 'This product is not blacklisted.',
                      btnText: 'Search another',
                      btnTap: () {
                        searchFocusNode.requestFocus();
                      },
                      containerTap: () {
                        searchFocusNode.unfocus();
                      },
                    )
                  else if (state is FilteredProductListLoaded &&
                      products.isEmpty &&
                      cleared == true)
                    TextFeedbackContainer(
                      text: 'Boycott blacklisted products.',
                      btnText: 'Search',
                      btnTap: () {
                        searchFocusNode.requestFocus();
                      },
                    )
                  else
                    Expanded(
                      child: KGrid(
                        items: products,
                        loadingItems: 10,
                        topPadding: 5.h,
                        bottomPadding: 100.h,
                        itemBuilder: (context, index) {
                          ProductEntity product = products[index];
                          return ProductCard(
                            product: product,
                            onTap: () {
                              router.pushNamed(AppRouter.productPage, params: {
                                RouterParams.id: product.id.toString(),
                              });
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _getSearchResult(BuildContext context) {
    if (searchController.text.isNotEmpty) {
      context.read<ProductBloc>().add(GetFilteredProductsEvent(
            searchText: searchController.text,
          ));
      setState(() {
        cleared = false;
      });

      SystemChannels.textInput.invokeMethod('TextInput.hide');
    } else {
      kSnackBar(
        context: context,
        message: 'Search with the name of the product!',
        position: FlashPosition.top,
        type: AlertType.failed,
      );
    }
  }
}

class TextFeedbackContainer extends StatelessWidget {
  final String text;
  final String? btnText;
  final Function()? btnTap;
  final Function()? containerTap;
  const TextFeedbackContainer({
    Key? key,
    required this.text,
    this.btnText,
    this.btnTap,
    this.containerTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        // onTap: containerTap,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 80.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                  ),
                ),
                btnText != null
                    ? TextButton(
                        onPressed: btnTap,
                        child: Text(
                          btnText!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
