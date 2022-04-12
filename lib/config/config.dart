import 'package:flutter/material.dart';

class TravelTheme {
  static const Color scaffoldBackgroundColor = Color(0xFFEBF2FC);
  static const Color primaryColor = Color(0xFF329BCE);
  static const Color grey = Color(0xFFC0BFBD);
  static const Color darkGrey = Color(0xFF878787);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static ThemeData get theme => ThemeData(
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: white,
          surface: scaffoldBackgroundColor,
          onSurface: white,
          background: scaffoldBackgroundColor,
          onBackground: white,
          error: Colors.red,
          onError: white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
            headline6: TextStyle(
          fontSize: 22,
        )),
        appBarTheme: const AppBarTheme(
          titleSpacing: 8,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: primaryColor,
        ),
        iconTheme: const IconThemeData(
          color: black,
        ),
      );
}
