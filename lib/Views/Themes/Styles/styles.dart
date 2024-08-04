import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';

class CustomStyles {
  static final themeData = ThemeData().copyWith(
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Colors.black,
      prefixStyle: GoogleFonts.openSans(),
      suffixIconColor: Colors.black,
      suffixStyle: GoogleFonts.openSans(),
      enabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
        fontSize: 35,
        fontWeight: FontWeight.w600,
        color: AppColorPalette.primarycolor,
      ),
      titleMedium: GoogleFonts.openSans(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.lato(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: AppColorPalette.primarycolor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorPalette.primarycolor,
        textStyle: GoogleFonts.openSans(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColorPalette.leapcolor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColorPalette.primarycolor,
      secondary: Colors.black,
    ),
  );
}
