import 'package:boycott_islamophobes/core/router/app_router.dart';
import 'package:boycott_islamophobes/features/product/presentation/widgets/product_loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';

import '../../../../core/constants/colors.dart';
import '../bloc/product_bloc.dart';
import '../widgets/product_card.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({Key? key}) : super(key: key);

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  List<ProductEntity> products = [];

  @override
  void initState() {
    context.read<ProductBloc>().add(GetAllProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blacklisted Products'),
        elevation: 1,
      ),
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductListLoaded) {
              products = state.products;
            }
            return Container(
              color: KColors.primary.shade100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (state is ProductListLoading) {
                            return ProductsGrid(
                              products: products,
                              isLoading: true,
                            );
                          }
                          return ProductsGrid(products: products);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  final bool? isLoading;
  final List<ProductEntity> products;
  const ProductsGrid({
    Key? key,
    this.isLoading,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: 20.h,
      ),
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8.h,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.w,
      ),
      itemCount: isLoading == true ? 5 : products.length,
      itemBuilder: (BuildContext context, int index) {
        if (isLoading == true) {
          return const ProductLoadingCard();
        } else {
          ProductEntity product = products[index];
          return ProductCard(
            product: product,
            onTap: () {
              router.pushNamed(
                AppRouter.productPage,
                params: {
                  RouterParams.productId: product.id.toString(),
                },
              );
            },
          );
        }
      },
    );
  }
}
