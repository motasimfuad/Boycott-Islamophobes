import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home_page.dart';
import '../../domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final bool? isLoading;
  const ProductCard({
    Key? key,
    required this.product,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      color: Colors.white,
      onTap: () {
        // router.pushNamed(AppRouter.allProductsPage);
      },
      child: Column(
        children: [
          Container(
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Image.network(
              product.logoUrl,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              },
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Badge(
            toAnimate: false,
            elevation: 0,
            shape: BadgeShape.square,
            badgeColor: Colors.black,
            borderRadius: BorderRadius.circular(15.r),
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 5.h,
            ),
            badgeContent: Text(
              product.countryName ?? '',
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
