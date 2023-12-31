import 'package:flutter/material.dart';
import 'package:school_sr_tableau/custom_colors.dart';

class AppTheme {
  static ThemeData p1() {
    return ThemeData.light().copyWith(primaryColor: CustomColors.p1);
  }

  static ThemeData p2() {
    return ThemeData.light().copyWith(primaryColor: CustomColors.p2);
  }

  static ThemeData p3() {
    return ThemeData.light().copyWith(primaryColor: CustomColors.p3);
  }

  static ThemeData p4() {
    return ThemeData.light().copyWith(primaryColor: CustomColors.p4);
  }

  static ThemeData lightTheme() {
    Color lightBackground = const Color.fromARGB(255, 245, 245, 245);
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: lightBackground,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightBackground,
      ),
    );
  }

  static ThemeData darkTheme() {
    Color darkBackground = const Color.fromARGB(255, 84, 84, 84);

    return ThemeData.dark().copyWith(
      primaryColor: Colors.grey,
      scaffoldBackgroundColor: const Color.fromARGB(255, 87, 87, 87),
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackground,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkBackground,
      ),
    );
  }
}
