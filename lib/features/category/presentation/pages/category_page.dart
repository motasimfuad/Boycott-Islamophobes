import 'package:boycott_islamophobes/core/constants/colors.dart';
import 'package:boycott_islamophobes/core/router/app_router.dart';
import 'package:boycott_islamophobes/core/widgets/k_grid.dart';
import 'package:boycott_islamophobes/core/widgets/k_image_container.dart';
import 'package:boycott_islamophobes/core/widgets/k_loading_indicator.dart';
import 'package:boycott_islamophobes/core/widgets/k_shimmer.dart';
import 'package:boycott_islamophobes/features/category/domain/entities/category_entity.dart';
import 'package:boycott_islamophobes/features/product/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product/domain/entities/product_entity.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../bloc/category_bloc.dart';

class CategoryPage extends StatefulWidget {
  final int categoryId;
  const CategoryPage({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int? _selectedIndex;
  List<CategoryEntity> categories = [];
  List<ProductEntity> products = [];

  @override
  void initState() {
    context
        .read<CategoryBloc>()
        .add(GetCategoryEvent(categoryId: widget.categoryId));
    context
        .read<ProductBloc>()
        .add(GetFilteredProductsEvent(categoryId: widget.categoryId));

    context.read<CategoryBloc>().add(GetAllCategoriesEvent());

    // var selectedCat =
    //     categories.firstWhere((element) => element.id == widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CategoryBloc>().add(GetAllCategoriesEvent());
        return true;
      },
      child: Scaffold(
        backgroundColor: KColors.primary.shade100,
        appBar: AppBar(
          title: const Text('Browse by Category'),
          backgroundColor: Colors.black,
          elevation: 1,
        ),
        body: BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is CategoriesLoading) {}
          },
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              categories = state.categories;

              var selectedCatIndex = categories
                  .indexWhere((element) => element.id == widget.categoryId);
              _selectedIndex = selectedCatIndex;
            }
            if (state is CategorySelected) {
              _selectedIndex = categories
                  .indexWhere((element) => element.id == state.category.id);
            }
            if (state is CategoriesLoading) {
              return const Center(
                child: KLoadingIndicator(),
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      return LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return SizedBox(
                          width: 100.w,
                          child: SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minWidth: constraints.maxHeight),
                              child: IntrinsicHeight(
                                child: NavigationRail(
                                  backgroundColor: KColors.primary.shade100,
                                  extended: false,
                                  leading: GestureDetector(
                                    onTap: () {
                                      _selectedIndex = null;
                                      context.read<CategoryBloc>().add(
                                          const GetCategoryEvent(
                                              categoryId: -1));
                                      context
                                          .read<ProductBloc>()
                                          .add(GetAllProductsEvent());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 12.w,
                                        right: 12.w,
                                        top: 5.h,
                                      ),
                                      child: KImageContainer(
                                        imageUrl: '',
                                        padding: 10.h,
                                        height: 35.h,
                                        fallBackText: 'All',
                                        radius: 15.w,
                                        hasBorder: _selectedIndex == null
                                            ? true
                                            : false,
                                      ),
                                    ),
                                  ),
                                  selectedIndex: _selectedIndex,
                                  onDestinationSelected: (int index) {
                                    var selectedCat = categories[index];

                                    context.read<CategoryBloc>().add(
                                        GetCategoryEvent(
                                            categoryId: selectedCat.id));

                                    context.read<ProductBloc>().add(
                                        GetFilteredProductsEvent(
                                            categoryId: selectedCat.id));
                                  },
                                  labelType: NavigationRailLabelType.all,
                                  destinations: (state is CategoriesLoading)
                                      ? _buildLoadingCategoryList()
                                      : _buildLoadedCategoryList(),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    width: 1,
                  ),
                  Expanded(
                    child: Container(
                      color: KColors.primary.shade100,
                      child: BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (state is ProductListLoaded) {
                            products = state.products;
                          }
                          if (state is FilteredProductListLoaded) {
                            products = state.products;
                          }
                          if (products.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'No Product Found!',
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return KGrid(
                            items: products,
                            isLoading: (state is FilteredProductListLoading)
                                ? true
                                : false,
                            loadingItems: 3,
                            childAspectRatio: 0.65.w,
                            itemBuilder: (context, index) {
                              ProductEntity product = products[index];
                              return ProductCard(
                                product: product,
                                onTap: () {
                                  router.pushNamed(
                                    AppRouter.productPage,
                                    params: {
                                      RouterParams.id: product.id.toString(),
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  List<NavigationRailDestination> _buildLoadedCategoryList() {
    return categories
        .map(
          (category) => NavigationRailDestination(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: KImageContainer(
                imageUrl: category.imageUrl,
                height: 75.h,
              ),
            ),
            selectedIcon: Container(
              padding: EdgeInsets.only(bottom: 5.h),
              child: KImageContainer(
                imageUrl: category.imageUrl,
                hasBorder: true,
                height: 75.h,
              ),
            ),
            label: Text(
              category.name,
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
          ),
        )
        .toList();
  }

  List<NavigationRailDestination> _buildLoadingCategoryList() {
    return List.generate(5, (index) {
      return NavigationRailDestination(
        icon: KShimmer(
          child: KImageContainer(
            imageUrl: '',
            fallBackText: '',
            height: 80.h,
          ),
        ),
        label: const Text(''),
      );
    });
  }
}
