import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimary = Color(0xFF5D9CEC);
  static const Color lightScaffoldBackground = Color(0xFFDFECDB);
  static const Color darkScaffoldBackground = Color(0xFF060E1E);
  static const Color green = Color(0xFF61E757);
  static const Color red = Color(0xFFEC4B4B);
  static final ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimary,
      scaffoldBackgroundColor: lightScaffoldBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(size: 36, color: lightPrimary),
        unselectedIconTheme: IconThemeData(
          size: 36,
        ),
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              color: lightPrimary, fontSize: 24, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 16, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
  static final ThemeData darkTheme = ThemeData(
      primaryColor: lightPrimary,
      scaffoldBackgroundColor: darkScaffoldBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(size: 36, color: lightPrimary),
        unselectedIconTheme: IconThemeData(
          size: 36,
        ),
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              color: lightPrimary, fontSize: 24, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 12, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
}
