import 'package:flutter/material.dart';

class AppTheme {
  // Define color variables
  // Linear gradient cho nền sáng
  static const Gradient lightBackgroundGradient = LinearGradient(
    colors: [Color(0xFFFCE4EC), Color(0xFFF8BBD0)], // Tông màu nhạt
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
    // Linear gradient cho nền tối

  static const Color lightTextColor = Color.fromARGB(255, 116, 179, 74);
  
  // this one effect to text color 
  static const Color seedColor = Color.fromARGB(255, 36, 141, 62);

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor).copyWith(
      primary: lightTextColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    // brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: lightTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: lightTextColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: lightTextColor,
      ),
      titleLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: lightTextColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 12.0,
        color: lightTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 10.0,
        color: lightTextColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightTextColor,
      foregroundColor: lightTextColor,
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: lightTextColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

class AppText{
  static const TextStyle headingLargeStyle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400
  );
  static const TextStyle headingMediumStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600
  );
  static const TextStyle headingSmallStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600
  );
  static const TextStyle headlineStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700
  );
  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400
  );
  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400
  );
  static const TextStyle captionStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400
  );
  static const TextStyle buttonStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600
  );
}

class AppColor{
  // primary color
  static const Color primaryColorLight = Color.fromARGB(255, 145, 226, 97);
  static const Color primaryColorDark = Color.fromARGB(255, 110, 110, 110);
  
  // text color
  static const Color textColorLight = Color.fromARGB(255, 255, 255, 255);
  static const Color textOutlineColorLight = Color.fromARGB(255, 50, 158, 83);
  static const Color textDefaultColor = Color.fromARGB(255, 88, 88, 88);
  static const Color textCardHomeBarColor = Color.fromARGB(255, 207, 207, 207);

  // button color
  static const Color buttonOutlineLight = Color.fromARGB(255, 201, 228, 198);
  static const Color buttonColorLight = Color.fromARGB(255, 24, 82, 41);
  static const Color buttonDisableColorLight =  Color.fromARGB(255, 94, 128, 107);
}