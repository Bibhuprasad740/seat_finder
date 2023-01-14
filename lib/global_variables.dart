import 'package:flutter/material.dart';
import 'package:seat_finder/controllers/theme_controller.dart';

import 'controllers/seat_controller.dart';

class GlobalVariables {
  //controllers
  static var themeController = ThemeController.instance;
  static var seatController = SeatController.instance;

  // colors
  static const darkBackgroundColor = Color.fromARGB(255, 5, 0, 27);
  static const lightBackgroundColor = Colors.white;
  static const selectedColor = Color.fromARGB(255, 2, 74, 207);
  static var accentColor = Colors.teal.shade200;
  static const darkPrimaryColor = Colors.white;
  static const lightPrimaryColor = Colors.black;
  static const secondaryColor = Colors.grey;
}
