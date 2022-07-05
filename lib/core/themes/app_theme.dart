import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  const AppTheme._();
  static final lightTheme = ThemeData(
    primarySwatch: KColors.primary,
    canvasColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.brown.shade50,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
