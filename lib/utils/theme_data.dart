import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF416FDF),
  onPrimary: Colors.white,
  secondary: Color(0xFF6EAEE7),
  onSecondary: Colors.white,
  error: Color(0xFFBA1A1A),
  onError: Colors.white,
  background: Colors.white,
  onBackground: Colors.black,
  shadow: Colors.black,
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAE3),
  onSurface: Color(0XFF1A1C18)
); 

const darkColorsScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF416FDF),
  onPrimary: Colors.white,
  secondary: Color(0xFF6EAEE7),
  onSecondary: Colors.white,
  error: Color(0xFFBA1A1A),
  onError: Colors.white,
  background: Color(0xFF1A1C18),
  onBackground: Colors.white,
  shadow: Colors.white,
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFF2A2D27),
  onSurface: Color(0XFFF9FAE3)
);

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        lightColorScheme.primary
       ),
      foregroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      elevation: MaterialStateProperty.all<double>(5.0),
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 20.0,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColorsScheme,
);



// style class for entire app theme
// class Styles {
//   static ThemeData themeData({
//     required bool isDarkMode,
//     required BuildContext context,
//   }){
//     return ThemeData(
//       scaffoldBackgroundColor: isDarkMode 
//       ? AppColors.darkBackground.color
//       : AppColors.lightBackground.color,

//       cardColor: isDarkMode
//       ? AppColors.darkCardColor.color
//       : AppColors.lightCardColor.color,

//       brightness: isDarkMode 
//       ? Brightness.dark 
//       : Brightness.light,

//       appBarTheme: AppBarTheme(
//         backgroundColor: isDarkMode
//       ? AppColors.darkCardColor.color
//       : AppColors.lightCardColor.color, elevation: 0.0, 
//         centerTitle: false, titleTextStyle: TextStyle(
//           color: isDarkMode ? 
//           AppColors.darkTitleColor.color 
//           : AppColors.lightTitleColor.color,
//           fontWeight: FontWeight.bold,
//       ),
//       ),
//     );
//   }
// }



