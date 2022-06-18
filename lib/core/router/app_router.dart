import 'package:boycott_islamophobes/features/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String homePage = '/';
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
        }),
  ],
);
