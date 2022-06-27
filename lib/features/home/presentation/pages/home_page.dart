import 'package:boycott_islamophobes/core/constants/strings.dart';
import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';
import 'package:boycott_islamophobes/features/company/presentation/bloc/company_bloc.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/k_appbar.dart';
import '../../../../core/widgets/k_card.dart';
import '../../../category/domain/entities/category_entity.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
import '../../../country/domain/entities/country_entity.dart';
import '../../../country/presentation/bloc/country_bloc.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../widgets/home_page_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductEntity> products = [];
  List<CategoryEntity> categories = [];
  List<CountryEntity> countries = [];
  List<CompanyEntity> companies = [];

  @override
  void initState() {
    context.read<ProductBloc>().add(GetAllProductsEvent());
    context.read<CategoryBloc>().add(GetAllCategoriesEvent());
    context.read<CountryBloc>().add(GetAllCountriesEvent());
    context.read<CompanyBloc>().add(GetAllCompaniesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primary.shade100,
      appBar: const KAppbar(
        title: 'Boycott Islamophobes',
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Container(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
            bottom: 100.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              KCard(
                // minHeight: 160.h,
                height: 160.w,
                maxHeight: 200,
                width: double.infinity,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    'Blacklists',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    gradient: LinearGradient(
                      colors: [
                        KColors.primary,
                        KColors.primary.shade600,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: Column(
                  children: [
                    Row(
                      children: [
                        BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) {
                            if (state is ProductListLoaded) {
                              products = state.products;
                            }

                            return HomePageCard(
                              title: 'Products',
                              totalItems: products.length.toString(),
                              imageName: Images.productIcon,
                              onTap: () {
                                router.pushNamed(AppRouter.allProductsPage);
                              },
                            );
                          },
                        ),
                        SizedBox(width: 20.w),
                        BlocBuilder<CategoryBloc, CategoryState>(
                          builder: (context, state) {
                            if (state is CategoriesLoaded) {
                              categories = state.categories;
                            }
                            return HomePageCard(
                              title: 'Categories',
                              totalItems: categories.length.toString(),
                              imageName: Images.categoryIcon,
                              onTap: () {
                                router.pushNamed(AppRouter.allCategoriesPage);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.w),
                    Row(
                      children: [
                        BlocBuilder<CountryBloc, CountryState>(
                          builder: (context, state) {
                            if (state is CountryListLoaded) {
                              countries = state.countries;
                            }

                            return HomePageCard(
                              title: 'Countries',
                              totalItems: countries.length.toString(),
                              imageName: Images.countryIcon,
                              onTap: () {
                                router.pushNamed(AppRouter.allCountriesPage);
                              },
                            );
                          },
                        ),
                        SizedBox(width: 20.w),
                        BlocBuilder<CompanyBloc, CompanyState>(
                          builder: (context, state) {
                            if (state is CompanyListLoaded) {
                              companies = state.companies;
                            }

                            return HomePageCard(
                              title: 'Companies',
                              imageName: Images.companyIcon,
                              totalItems: companies.length.toString(),
                              onTap: () {},
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Expanded(
              //   child: Container(
              //     padding: EdgeInsets.all(15.w),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(30.w),
              //         gradient: LinearGradient(
              //           colors: [
              //             KColors.primary,
              //             KColors.primary.shade600,
              //           ],
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //         )),
              //     child: GridView.builder(
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         childAspectRatio: 1.h,
              //         crossAxisSpacing: 12.w,
              //         mainAxisSpacing: 12.w,
              //       ),
              //       itemCount: 4,
              //       itemBuilder: (BuildContext context, int index) {
              //         return KCard(
              //           onTap: () {
              //             router.pushNamed(AppRouter.allProductsPage);
              //           },
              //         );
              //       },
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 70.h,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
