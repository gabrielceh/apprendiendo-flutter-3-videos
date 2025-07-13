import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF4C00FF);

  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        brightness: Brightness.dark
  );
}
