import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: const TextTheme(
       headlineLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        // Các thuộc tính khác của TextStyle
      ),
    )
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
