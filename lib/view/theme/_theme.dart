import 'package:flutter/material.dart';

class ToDoTheme {
  static TextTheme lightTextTheme = const TextTheme(
    headline1: TextStyle(fontFamily: "red-hat", fontSize: 36, color: _primary),
    headline6: TextStyle(fontSize: 12, color: _primary),
    headline5: TextStyle(fontSize: 24, color: Color.fromRGBO(255, 255, 255, 1)),
    headline4:
        TextStyle(fontSize: 24, color: _primary, fontFamily: 'TechnaSans'),
  );

  static const Color _primary = Color.fromRGBO(188, 36, 60, 1);
  static const Color _secondary = Colors.white;

  static ThemeData light() {
    return ThemeData(
        primaryColor: _primary,
        secondaryHeaderColor: _secondary,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: _primary),
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
