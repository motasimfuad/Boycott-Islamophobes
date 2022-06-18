import 'package:boycott_islamophobes/features/bottom_nav.dart';
import 'package:boycott_islamophobes/features/product/presentation/pages/all_products_page.dart';
import 'package:boycott_islamophobes/features/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String homePage = '/';
  static const String allProductsPage = 'products';
  static const String productPage = 'productPage';
  static const String allCountriesPage = 'allCountriesPage';
  static const String allCategoriesPage = 'allCategoriesPage';
  static const String allCompaniesPage = 'allCompaniesPage';
  static const String searchPage = 'searchPage';
  static const String faqPage = 'faqPage';
  static const String settingsPage = 'settingsPage';
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
        print(state.path);
        return MaterialPage(
          key: state.pageKey,
          child: const AllProductsPage(),
        );
      },
    ),
  ],
);
