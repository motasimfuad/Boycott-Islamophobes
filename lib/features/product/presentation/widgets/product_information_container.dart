import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/k_card.dart';
import '../../domain/entities/product_entity.dart';

class ProductInformationContainer extends StatelessWidget {
  final ProductEntity? product;
  final List<Widget> items;
  final bool? hasShadow;
  const ProductInformationContainer({
    Key? key,
    required this.product,
    required this.items,
    this.hasShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCard(
      color: Colors.white,
      xPadding: 0,
      yPadding: 0,
      radius: 20.r,
      hasShadow: hasShadow,
      child: Container(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          top: 12.w,
        ),
        child: Column(
          children: items,
        ),
      ),
    );
  }
}
