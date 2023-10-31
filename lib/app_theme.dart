import 'package:flutter/material.dart';

class AppTheme {
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
