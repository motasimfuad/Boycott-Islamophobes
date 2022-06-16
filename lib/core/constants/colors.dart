import 'package:flutter/material.dart';

class KColors {
  static const grey = Color(0xffb4c9de);
  static const greyLight = Color(0xfff8f8fa);
  static const green = Color(0xff02A499);
  static const blue = Color(0xff1BB1E7);

  static const success = Color(0xff02a499);
  static const danger = Color(0xffec4561);
  static const warning = Color(0xfff8b425);
  static const info = Color(0xff38a4f8);

  static const secondary = Color(0xff333547);
  static const secondaryLight = Color(0xff383b4e);
  static const secondaryDark = Color(0xff292b38);

  static const primary = Colors.deepPurple;
}

final Map<int, Color> _darkMap = {
  50: Colors.brown[50] as Color,
  100: Colors.brown[100] as Color,
  200: Colors.brown[200] as Color,
  300: Colors.brown[300] as Color,
  400: Colors.brown[400] as Color,
  500: Colors.brown[900] as Color,
  600: Colors.brown[600] as Color,
  700: Colors.brown[700] as Color,
  800: Colors.brown[800] as Color,
  900: Colors.brown[900] as Color,
};

final MaterialColor darkSwatch =
    MaterialColor(Colors.brown[900]!.value, _darkMap);
