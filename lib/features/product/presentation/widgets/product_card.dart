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
          Hero(
            tag: product.id,
            child: KImageContainer(
              imageUrl: product.logoUrl,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              product.name,
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
            padding: EdgeInsets.only(top: 8.h),
            child: KBadge(
              badgeText: product.countryName ?? 'Not specified',
            ),
          ),
        ],
      ),
    );
  }
}
