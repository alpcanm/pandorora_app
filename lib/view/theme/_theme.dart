import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText2: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.openSans(
      fontSize: 12.0,
    ),
    headline1: GoogleFonts.marcellus(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle2: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static const Color _primary = Colors.purple;
  static const Color _secondary = Colors.yellow;
  static ThemeData light() {
    return ThemeData(
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: _primary),
        appBarTheme: const AppBarTheme(
          foregroundColor: _secondary,
          backgroundColor: _primary,
        ),
        textTheme: lightTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: _primary)),
        textButtonTheme:
            TextButtonThemeData(style: TextButton.styleFrom(primary: _primary)),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _primary),
          ),
        ));
  }
}
