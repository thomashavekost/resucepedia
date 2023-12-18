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

  static final ThemeData reaWatchTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color:_darkSecondaryColor, fontWeight: FontWeight.bold, fontSize: 26 ),
        color: _lightInfo,
        iconTheme: IconThemeData(color: _darkOnPrimaryColor),
      ),
      iconTheme: IconThemeData(
        color: _iconColor,
      ),
      dividerTheme: DividerThemeData(
          color: Colors.black12
      ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
    )

  );

}