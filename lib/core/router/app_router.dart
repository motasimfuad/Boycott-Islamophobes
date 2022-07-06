import 'package:boycott_islamophobes/features/bottom_nav.dart';
import 'package:boycott_islamophobes/features/category/presentation/pages/all_categories_page.dart';
import 'package:boycott_islamophobes/features/category/presentation/pages/category_page.dart';
import 'package:boycott_islamophobes/features/company/presentation/pages/all_companies_page.dart';
import 'package:boycott_islamophobes/features/country/presentation/pages/all_countries_page.dart';
import 'package:boycott_islamophobes/features/country/presentation/pages/country_page.dart';
import 'package:boycott_islamophobes/features/info/presentation/pages/info_page.dart';
import 'package:boycott_islamophobes/features/product/presentation/pages/all_products_page.dart';
import 'package:boycott_islamophobes/features/product/presentation/pages/product_page.dart';
import 'package:boycott_islamophobes/features/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String homePage = '/';
  static const String allProductsPage = 'products';
  static const String productPage = 'product';
  static const String allCountriesPage = 'countries';
  static const String countryPage = 'country';
  static const String allCategoriesPage = 'categories';
  static const String categoryPage = 'category';
  static const String allCompaniesPage = 'companies';
  static const String searchPage = 'search';
  static const String faqPage = 'faqPage';
  static const String infoPage = 'info';
}

class RouterParams {
  static const String id = 'id';
}

final router = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation: AppRouter.homePage,
  routes: [
    GoRoute(
      name: AppRouter.homePage,
      path: AppRouter.homePage,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const BottomNav(),
        );
      },
    ),
    GoRoute(
      name: AppRouter.searchPage,
      path: '/${AppRouter.searchPage}',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const SearchPage(),
        );
      },
    ),
    GoRoute(
      name: AppRouter.allProductsPage,
      path: '/${AppRouter.allProductsPage}',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const AllProductsPage(),
        );
      },
      routes: [
        GoRoute(
            name: AppRouter.productPage,
            path: ':${RouterParams.id}',
            pageBuilder: (context, state) {
              final productId = state.params[RouterParams.id];

              return MaterialPage(
                // key: state.pageKey,
                child: ProductPage(
                  productId: int.parse(productId.toString()),
                ),
              );
            })
      ],
    ),
    GoRoute(
      name: AppRouter.allCategoriesPage,
      path: '/${AppRouter.allCategoriesPage}',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const AllCategoriesPage(),
        );
      },
      routes: [
        GoRoute(
            name: AppRouter.categoryPage,
            path: ':${RouterParams.id}',
            pageBuilder: (context, state) {
              final categoryId = state.params[RouterParams.id];
              return MaterialPage(
                // key: state.pageKey,
                child: CategoryPage(
                  categoryId: int.parse(categoryId.toString()),
                ),
              );
            })
      ],
    ),

    // countries
    GoRoute(
      name: AppRouter.allCountriesPage,
      path: '/${AppRouter.allCountriesPage}',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const AllCountriesPage(),
        );
      },
      routes: [
        GoRoute(
            name: AppRouter.countryPage,
            path: ':${RouterParams.id}',
            pageBuilder: (context, state) {
              final countryId = state.params[RouterParams.id];
              return MaterialPage(
                // key: state.pageKey,
                child: CountryPage(id: int.parse(countryId.toString())),
              );
            }),
      ],
    ),

    // companies
    GoRoute(
      name: AppRouter.allCompaniesPage,
      path: '/${AppRouter.allCompaniesPage}',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const AllCompaniesPage(),
        );
      },
    ),

    // info
    GoRoute(
      name: AppRouter.infoPage,
      path: '/${AppRouter.infoPage}',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const InfoPage(),
        );
      },
    ),
  ],
);
