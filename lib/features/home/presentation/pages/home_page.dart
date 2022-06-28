import 'package:boycott_islamophobes/core/constants/strings.dart';
import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';
import 'package:boycott_islamophobes/features/company/presentation/bloc/company_bloc.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
import '../../../quote/domain/entities/quote_entity.dart';
import '../../../quote/presentation/bloc/quote_bloc.dart';
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
  List<QuoteEntity> quotes = [];

  @override
  void initState() {
    context.read<QuoteBloc>().add(GetAllQuotesEvent());
    _getAllBlacklists();
    super.initState();
  }

  void _getAllBlacklists() {
    context.read<ProductBloc>().add(GetAllProductsEvent());
    context.read<CategoryBloc>().add(GetAllCategoriesEvent());
    context.read<CountryBloc>().add(GetAllCountriesEvent());
    context.read<CompanyBloc>().add(GetAllCompaniesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primary.shade100,
      appBar: const KAppbar(
        title: 'Boycott Islamophobes',
      ),
      body: SingleChildScrollView(
        // primary: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
            // bottom: 100.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              KCard(
                height: 160.w,
                maxHeight: 200,
                xPadding: 0,
                yPadding: 0,
                hasShadow: false,
                radius: 0,
                color: Colors.transparent,
                width: double.infinity,
                child: BlocBuilder<QuoteBloc, QuoteState>(
                  builder: (context, state) {
                    if (state is QuoteListLoaded) {
                      quotes = state.quotes;
                    }

                    return CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: (quotes.length > 1) ? true : false,
                        autoPlayInterval: const Duration(seconds: 10),
                        disableCenter: true,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        height: double.infinity,
                      ),
                      items: quotes.map((quote) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              // width: MediaQuery.of(context).size.width,
                              // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              padding: EdgeInsets.symmetric(
                                vertical: 5.h,
                                horizontal: 5.w,
                              ),
                              child: KCard(
                                xPadding: 5.w,
                                yPadding: 5.w,
                                width: double.infinity,
                                color: Colors.white,
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/backgrounds/quote_background.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '" ${quote.quote} "',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: KColors.primary.shade600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        '- ${quote.by}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.italic,
                                          color: KColors.primary.shade400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Blacklists',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: KColors.primary.shade800,
                      ),
                    ),
                    KCard(
                      hasShadow: false,
                      radius: 12.r,
                      onTap: () {
                        _getAllBlacklists();
                      },
                      color: KColors.primary.shade500,
                      child: Icon(
                        Icons.sync_rounded,
                        size: 22.h,
                        color: KColors.primary.shade50,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
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
                  ),
                ),
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
                              onTap: () {
                                router.pushNamed(AppRouter.allCompaniesPage);
                              },
                            );
                          },
                        ),
                      ],
                    )
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
