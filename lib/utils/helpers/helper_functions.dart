import 'package:flutter/material.dart';

class HelperFunctions {
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
