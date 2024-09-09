import 'package:flutter/material.dart';
import 'package:tech_blog/constant/colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return const TextStyle(
              fontSize: 16,
              fontFamily: 'IranYekan',
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle,
            );
          }
          return const TextStyle(
            fontSize: 15,
            fontFamily: 'IranYekan',
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubTitle,
          );
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return SolidColors.primaryColor.withOpacity(0.8);
          }
          return SolidColors.primaryColor;
        }),
      ),
    ),
    fontFamily: 'IranYekan',
    brightness: Brightness.light,
    hintColor: SolidColors.primaryColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'IranYekan',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: SolidColors.posterTitle),
      titleMedium: TextStyle(
          fontFamily: 'IranYekan',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: SolidColors.posterSubTitle),
      bodyLarge: TextStyle(
          fontFamily: 'IranYekan', fontSize: 13, fontWeight: FontWeight.w300),
      displayMedium: TextStyle(
          fontFamily: 'IranYekan',
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w300),
      displaySmall: TextStyle(
          fontFamily: 'IranYekan',
          fontSize: 16,
          color: SolidColors.seeMore,
          fontWeight: FontWeight.w900),
      headlineMedium: TextStyle(
          fontFamily: 'IranYekan',
          fontSize: 14,
          color: Color.fromARGB(255, 70, 70, 70),
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontFamily: 'IranYekan',
          fontSize: 14,
          color: SolidColors.hintText,
          fontWeight: FontWeight.w700),
    ),
  );
}
