import 'package:boycott_islamophobes/core/router/app_router.dart';
import 'package:boycott_islamophobes/core/widgets/k_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool isLoading = false;

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
            if (state is ProductListLoading) {
              isLoading = true;
            }
            if (state is ProductListLoaded) {
              products = state.products;
              isLoading = false;
            }
            return Container(
              color: KColors.primary.shade100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: KGrid(
                        isLoading: isLoading,
                        items: products,
                        itemBuilder: (context, index) {
                          final product = products[index];

                          return ProductCard(
                            product: product,
                            onTap: () {
                              router.pushNamed(
                                AppRouter.productPage,
                                params: {
                                  RouterParams.id: product.id.toString()
                                },
                              );
                            },
                          );
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
