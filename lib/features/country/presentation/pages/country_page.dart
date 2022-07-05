import 'package:boycott_islamophobes/core/widgets/k_image_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:boycott_islamophobes/core/constants/colors.dart';
import 'package:boycott_islamophobes/core/widgets/k_appbar.dart';
import 'package:boycott_islamophobes/features/country/domain/entities/country_entity.dart';
import 'package:boycott_islamophobes/features/country/presentation/bloc/country_bloc.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/k_grid.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../../product/presentation/widgets/product_card.dart';

class CountryPage extends StatefulWidget {
  final int id;
  const CountryPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage>
    with TickerProviderStateMixin {
  CountryEntity? country;
  List<ProductEntity> products = [];
  String? totalProducts;

  @override
  void initState() {
    context.read<CountryBloc>().add(GetCountryEvent(countryId: widget.id));
    context
        .read<ProductBloc>()
        .add(GetFilteredProductsEvent(countryId: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: const KAppbar(
        title: 'Blacklisted Country ',
      ),
      body: Column(
        children: [
          BlocBuilder<CountryBloc, CountryState>(
            builder: (context, state) {
              if (state is CountryLoading) {
                return Container(
                  height: 160.h,
                  width: double.infinity,
                  color: Colors.black,
                  child: const Center(
                    child: CupertinoActivityIndicator(
                      color: KColors.primary,
                    ),
                  ),
                );
              }

              if (state is CountryLoaded) {
                country = state.country;
              }

              return Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(country?.flagUrl ?? ''),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black,
                        Colors.black45,
                        Colors.black12,
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      KImageContainer(
                        imageUrl: country?.flagUrl ?? '',
                        height: 55.w,
                        width: 80.w,
                        radius: 15.r,
                        padding: 0,
                        imageFit: BoxFit.cover,
                        // hasBorder: true,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              country?.name ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            BlocBuilder<ProductBloc, ProductState>(
                              builder: (context, state) {
                                if (state is FilteredProductListLoading) {
                                  totalProducts = '...';
                                }
                                if (state is FilteredProductListLoaded) {
                                  totalProducts =
                                      state.products.length.toString();
                                }

                                return Text(
                                  'Blacklisted Products ($totalProducts)',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Container(
            color: Colors.black,
            child: TabBar(
              controller: tabController,
              indicatorPadding: const EdgeInsets.all(0),
              labelPadding: EdgeInsets.symmetric(vertical: 3.h),
              labelStyle: TextStyle(
                fontSize: 16.sp,
              ),
              indicatorWeight: 4,
              tabs: const [
                Tab(
                  text: 'Products',
                ),
                Tab(
                  text: 'Details',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is FilteredProductListLoaded) {
                      products = state.products;
                    }

                    return CountryAllProductsTab(
                      isLoading: (state is FilteredProductListLoading),
                      products: products,
                    );
                  },
                ),
                const CountryDetailsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CountryAllProductsTab extends StatelessWidget {
  final List<ProductEntity> products;
  bool? isLoading;
  CountryAllProductsTab({
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
                                params: {
                                  RouterParams.id: product.id.toString()
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              ));
  }
}

class CountryDetailsTab extends StatelessWidget {
  const CountryDetailsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.kBackgroundColor,
      child: const Center(
        child: Text(
          'Details will be added on \nupcoming updates InshaAllah!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
