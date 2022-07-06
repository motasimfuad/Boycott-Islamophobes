import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/k_grid.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../product/presentation/widgets/product_card.dart';

class CountryAllProductsTab extends StatelessWidget {
  final List<ProductEntity> products;
  final bool? isLoading;
  const CountryAllProductsTab({
    Key? key,
    required this.products,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.kBackgroundColor,
      child: (products.isEmpty && isLoading != true)
          ? const Center(
              child: Text(
                'No product found!',
                textAlign: TextAlign.center,
              ),
            )
          : Column(
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
                              params: {RouterParams.id: product.id.toString()},
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
