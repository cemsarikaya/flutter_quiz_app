import 'package:flutter/material.dart';

class LighTheme {
  late ThemeData theme;

  LighTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Color.fromARGB(255, 246, 198, 69),
          titleTextStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.8),
      colorScheme: const ColorScheme.light(),
    );
  }
}
