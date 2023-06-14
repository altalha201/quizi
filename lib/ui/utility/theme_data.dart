import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData quizITheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorPrimary,
      primary: colorPrimary,
    ),
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
      ),
      backgroundColor: Colors.white
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: colorPrimary,
    ),
  );
}