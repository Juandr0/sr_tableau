import 'package:flutter/material.dart';

/*   static final List<Color> tableauColors = [
    const Color.fromARGB(255, 74, 148, 177),
    const Color.fromARGB(255, 233, 91, 39),
    const Color.fromARGB(255, 70, 157, 107),
    const Color.fromARGB(255, 170, 43, 154),
  ];

  */
class AppTheme {
  static ThemeData p1() {
    return ThemeData.light()
        .copyWith(primaryColor: const Color.fromARGB(255, 74, 148, 177));
  }

  static ThemeData p2() {
    return ThemeData.light()
        .copyWith(primaryColor: const Color.fromARGB(255, 233, 91, 39));
  }

  static ThemeData p3() {
    return ThemeData.light()
        .copyWith(primaryColor: const Color.fromARGB(255, 70, 157, 107));
  }

  static ThemeData p4() {
    return ThemeData.light()
        .copyWith(primaryColor: const Color.fromARGB(255, 170, 43, 154));
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
