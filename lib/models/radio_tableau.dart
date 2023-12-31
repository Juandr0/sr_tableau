import 'package:flutter/material.dart';

class RadioTableau {
  const RadioTableau(
      {required this.title,
      required this.description,
      required this.startTime,
      required this.endTime,
      required this.imageString,
      required this.playerUrl,
      required this.channelName});

  final String title;
  final String description;
  final String startTime;
  final String endTime;
  final String imageString;
  final String playerUrl;
  final String channelName;

  /// Represents the corresponding colors of each tableau.
  /// Color[0] = P1
  /// Color[1] = P2
  /// Color[2] = P3
  /// Color[3] = P4
  static final List<Color> tableauColors = [
    const Color.fromARGB(255, 74, 148, 177),
    const Color.fromARGB(255, 233, 91, 39),
    const Color.fromARGB(255, 70, 157, 107),
    const Color.fromARGB(255, 170, 43, 154),
  ];
}
