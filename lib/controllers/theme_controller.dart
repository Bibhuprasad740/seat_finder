import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global_variables.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();
  static Rx<bool> isDark = Get.isDarkMode.obs;

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: GlobalVariables.accentColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    canvasColor: GlobalVariables.darkBackgroundColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: GlobalVariables.accentColor,
      secondary: GlobalVariables.darkPrimaryColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: GlobalVariables.accentColor,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: GlobalVariables.darkPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: GlobalVariables.darkPrimaryColor),
      // toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
    ),
  );

  // light Theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: GlobalVariables.accentColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    canvasColor: GlobalVariables.lightBackgroundColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: GlobalVariables.accentColor,
      secondary: GlobalVariables.lightPrimaryColor,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: GlobalVariables.accentColor,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: GlobalVariables.lightPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: GlobalVariables.lightPrimaryColor),
      // toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
    ),
  );
}
