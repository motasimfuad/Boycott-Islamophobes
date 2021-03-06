import 'package:boycott_islamophobes/core/constants/extensions.dart';
import 'package:boycott_islamophobes/features/product/presentation/widgets/product_information_container.dart';
import 'package:boycott_islamophobes/features/product/presentation/widgets/product_information_item.dart';
import 'package:boycott_islamophobes/features/product/presentation/widgets/product_page_notice.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/k_badge.dart';
import '../../../../core/widgets/k_card.dart';
import '../../../../core/widgets/k_image_container.dart';
import '../../domain/entities/product_entity.dart';

class ProductCardForDownload extends StatelessWidget {
  final ProductEntity product;
  const ProductCardForDownload({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: KCard(
          yPadding: 0,
          xPadding: 0,
          hasShadow: false,
          hasBorder: true,
          borderWidth: 4,
          color: Colors.red.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const ProductPageNotice(),
              Container(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: 15,
                ),
                child: Column(
                  children: [
                    KImageContainer(
                      imageUrl: product.logoUrl,
                      height: 180,
                      hasBorder: true,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      product.name.toCapitalized(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ProductInformationContainer(
                      product: product,
                      hasShadow: false,
                      items: [
                        ProductInformationItem(
                          itemTitle: 'Country',
                          itemValue: product.countryName,
                        ),
                        ProductInformationItem(
                          itemTitle: 'Company',
                          itemValue: product.companyName,
                          onTap: () {},
                          isVisible: (product.companyName != null &&
                              product.companyName!.isNotEmpty),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    KBadge(
                      textSize: 16,
                      xPadding: 5,
                      yPadding: 5,
                      radius: 500,
                      badgeColor: Colors.white,
                      badgeContent: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            child: Image.asset(
                              'assets/images/logo.png',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Boycott Islamophobes'.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
