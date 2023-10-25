import 'package:flutter/material.dart';
import 'package:your_matter/src/core/colors/custom_colors.dart';

ThemeData customTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: btnColor),
    textTheme: TextTheme(
        displayLarge: TextStyle(
            color: Color.fromRGBO(26, 76, 97, 1),
            fontSize: 30,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: Color.fromRGBO(26, 76, 97, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'Sansation',
            fontSize: 16),
        displaySmall: TextStyle(
            color: Color.fromRGBO(26, 76, 97, 1),
            fontSize: 15,
            fontFamily: 'Sansation'),
        labelMedium: TextStyle(
            fontFamily: 'Sansation',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        labelSmall: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: 'Sansation')),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: bgform,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: bgColor),
        borderRadius: BorderRadius.circular(borderform),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: bgColor),
        borderRadius: BorderRadius.circular(borderform),
      ),
    ),
  );
}
