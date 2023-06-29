import 'package:flutter/material.dart';
import 'package:newbankapp/src/common/themes/theme_colors.dart';

ThemeData Mytheme = ThemeData(
  primaryColor: ThemeColors.primaryColor,
  primarySwatch: ThemeColors.primaryColor,
  brightness: Brightness.dark,
  fontFamily: "Raleway",
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
  ),
);
