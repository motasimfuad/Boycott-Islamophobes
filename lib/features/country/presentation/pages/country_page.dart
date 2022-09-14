import 'package:boycott_islamophobes/core/constants/enums.dart';
import 'package:boycott_islamophobes/core/widgets/k_image_container.dart';
import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';
import 'package:boycott_islamophobes/features/country/presentation/widgets/country_all_companies_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:boycott_islamophobes/core/constants/colors.dart';
import 'package:boycott_islamophobes/core/widgets/k_appbar.dart';
import 'package:boycott_islamophobes/features/country/domain/entities/country_entity.dart';
import 'package:boycott_islamophobes/features/country/presentation/bloc/country_bloc.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';

import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../widgets/country_all_products_tab.dart';

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
  List<CompanyEntity> companies = [];
  String? totalProducts = "0";
  String? totalCompanies = "0";

  @override
  void initState() {
    totalProducts = "0";
    totalCompanies = "0";
    products.clear();
    companies.clear();
    context.read<CountryBloc>().add(GetCountryEvent(countryId: widget.id));
    context
        .read<CompanyBloc>()
        .add(GetFilteredCompaniesEvent(countryId: widget.id));
    context.read<ProductBloc>().add(GetFilteredProductsEvent(
          countryId: widget.id,
          filterType: ProductFilterType.byCountry,
        ));
    super.initState();
  }

  @override
  void dispose() {
    products.clear();
    companies.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: KAppbar(
        title: 'Country Details',
        actionBtn: Icons.info_outline,
        onActionPress: () {
          showDialog(context: context, builder: (context) => _buildDialog());
        },
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
                height: 150.h,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          country?.isBlacklisted == true
                              ? Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: Icon(
                                    Icons.not_interested_rounded,
                                    color: Colors.red,
                                    size: 20.w,
                                  ),
                                )
                              : const SizedBox(),
                          Expanded(
                            child: Text(
                              country?.name ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          KImageContainer(
                            imageUrl: country?.flagUrl ?? '',
                            height: 40.w,
                            width: 55.w,
                            radius: 8.r,
                            padding: 0,
                            imageFit: BoxFit.cover,
                            // hasBorder: true,
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                    'Products ($totalProducts)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 3.h),
                              BlocBuilder<CompanyBloc, CompanyState>(
                                builder: (context, state) {
                                  if (state is FilteredCompanyListLoading) {
                                    totalCompanies = '...';
                                  }
                                  if (state is FilteredCompanyListLoaded) {
                                    totalCompanies =
                                        state.companies.length.toString();
                                  }

                                  return Text(
                                    'Companies ($totalCompanies)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
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
                  text: 'Companies',
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
                BlocBuilder<CompanyBloc, CompanyState>(
                  builder: (context, state) {
                    if (state is FilteredCompanyListLoaded) {
                      companies = state.companies;
                    }

                    return CountryAllCompaniesTab(
                      companies: companies,
                      isLoading: (state is FilteredCompanyListLoading),
                    );
                  },
                ),
                // const CountryDetailsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(
          color: country?.isBlacklisted == true ? Colors.red : Colors.green,
          width: 2.w,
        ),
      ),
      content: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            country?.isBlacklisted == true
                ? Column(
                    children: [
                      Icon(
                        Icons.not_interested_rounded,
                        color: Colors.red,
                        size: 40.w,
                      ),
                      SizedBox(height: 15.w),
                      Text(
                        '${country?.name} is blacklisted.\n\nIt also has products and companies that are blacklisted.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 40.w),
                      (country?.id == 1)
                          ? _buildIllegalSettlerMessage()
                          : _buildBlacklistedMessage(),
                    ],
                  )
                : _buildNotBlacklistedMessage(),
          ],
        ),
      ),
    );
  }

  Column _buildIllegalSettlerMessage() {
    return Column(
      children: [
        Text(
          'If you are an illegal settler living forcefully in the home of a Palestinian family,\nPlease get back to the h*llhole you came from!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 30.w),
        Text(
          'Khaybar will return!'.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade200,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Text _buildBlacklistedMessage() {
    return Text(
      'If you live in ${country?.name},\nPlease try to avoid buying products from known and recognized islamophobe individuals/companies/groups of people.\nLook for similar alternative products that are available in the market!',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  _buildNotBlacklistedMessage() {
    return Column(
      children: [
        Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green,
          size: 40.w,
        ),
        SizedBox(height: 15.w),
        Text(
          '${country?.name} is not blacklisted.\n\nBut it might have products and companies that are blacklisted.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
