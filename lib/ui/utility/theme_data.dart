import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData quizITheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorPrimary,
      primary: colorPrimary,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: colorPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
      ),
      backgroundColor: Colors.white
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: colorPrimary, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorPrimary, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrange, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(
          fontSize: 18,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      )
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => colorPrimary)
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: colorPrimary,
    ),
  );
}