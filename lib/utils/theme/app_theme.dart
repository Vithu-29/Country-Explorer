import 'package:country_explorer/utils/theme/custom_themes/custom_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/elevated_button_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppbarTheme.lightAppBarTheme,
    textTheme: GoogleFonts.poppinsTextTheme(CustomTextTheme.lightTextTheme),
    elevatedButtonTheme: ElevateButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppbarTheme.darkAppBarTheme,
    textTheme: GoogleFonts.poppinsTextTheme(CustomTextTheme.darkTextTheme),
    elevatedButtonTheme: ElevateButtonTheme.darkElevatedButtonTheme,
  );
}
