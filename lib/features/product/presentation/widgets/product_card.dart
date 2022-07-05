import 'package:boycott_islamophobes/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/k_badge.dart';
import '../../../../core/widgets/k_card.dart';
import '../../../../core/widgets/k_image_container.dart';
import '../../domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final Function()? onTap;
  const ProductCard({
    Key? key,
    required this.product,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      color: Colors.white,
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: KImageContainer(
              imageUrl: product.logoUrl,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8.h,
              left: 10.w,
              right: 10.w,
            ),
            child: Text(
              product.name.toCapitalized(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 5.h,
              bottom: 5.h,
            ),
            child: KBadge(
              badgeText: product.countryName ?? 'Not specified',
            ),
          ),
        ],
      ),
    );
  }
}
