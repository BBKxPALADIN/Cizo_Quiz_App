import 'package:flutter/material.dart';

class CizoThemes {
  static TextTheme textTheme700 = const TextTheme(
    headline1: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    headline6: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  );

  static TextTheme textTheme600 = const TextTheme(
    headline1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headline2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    headline4: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextTheme textTheme400 = const TextTheme(
    headline2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    headline3: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData mainTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Color(0xff14C1FA),
      ),
    );
  }
}
