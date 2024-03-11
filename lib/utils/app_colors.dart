import 'package:flutter/material.dart';

enum AppColors {
  lightBackground,
  darkBackground,
  lightCardColor,
  darkCardColor,
  darkTitleColor,
  lightTitleColor,
  darkPrimary,
  darkAccent,
  lightAccent,
  darkMode, lightMode,
}

const Map<AppColors, Color> appColors = {
  AppColors.lightBackground: Color.fromARGB(255, 241, 241, 241),
  AppColors.darkBackground: Color.fromARGB(255, 13, 6, 37),
  AppColors.lightCardColor: Color.fromARGB(255, 255, 255, 255),
  AppColors.darkCardColor: Color.fromARGB(255, 211, 208, 224),
  AppColors.darkTitleColor: Color(0xFF181059),
  AppColors.lightTitleColor: Color.fromARGB(255, 175, 173, 190),
  AppColors.darkPrimary: Color.fromARGB(255, 213, 215, 225),
  AppColors.darkAccent: Color.fromARGB(255, 195, 193, 209),
  AppColors.lightAccent: Color.fromARGB(255, 229, 227, 248),
  AppColors.darkMode: Color.fromARGB(255, 0, 0, 0),
  AppColors.lightMode: Color.fromARGB(255, 255, 255, 255),
};



extension AppColorsExtension on AppColors {
  Color get color => appColors[this]!;
}
