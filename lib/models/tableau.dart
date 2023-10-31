import 'package:flutter/material.dart';

class Tableau {
  const Tableau({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endtime,
    required this.imageString,
  });

  final String title;
  final String description;
  final String startTime;
  final String endtime;
  final String imageString;

  /// Represents the corresponding colors of each tableau.
  /// Color[0] = P1
  /// Color[1] = P2
  /// Color[2] = P3
  static final List<Color> tableauColors = [
    const Color.fromARGB(255, 74, 148, 177),
    const Color.fromARGB(255, 233, 91, 39),
    const Color.fromARGB(255, 70, 157, 107),
  ];
}
