import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = Colors.white;
  static const Color _lightPrimaryColor = Color(0xFF8b7e74);
  static const Color _lightInfo = Color(0xFF283127);
  static const Color _lightSuccess = Color(0xFF5fa05b);
  static const Color _lightWarning = Color(0xFFdc9023);
  static const Color _lightDanger = Color(0xFFf44336);

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData rescuepediaTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: _lightWarning),
      useMaterial3: true,
      fontFamily: 'Raleway',
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
        bodyMedium: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
        bodyLarge: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w300),
      )
  );

}