import 'package:flutter/material.dart';
import 'package:school_sr_tableau/views/tableau_view.dart';
import 'package:school_sr_tableau/app_theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      home: const TableauView(),
    ),
  );
}

// extension Colors on Color {
//   Color get p1 => const Color.fromARGB(255, 74, 148, 177);
//   Color get p2 => const Color.fromARGB(255, 233, 91, 39);
//   Color get p3 => const Color.fromARGB(255, 70, 157, 107);
//   Color get p4 => const Color.fromARGB(255, 170, 43, 154);
// }
