import 'package:flutter/material.dart';

class Tableau {
  const Tableau({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endtime,
    required this.imageString,
    required this.themeColor,
  });

  final String title;
  final String description;
  final String startTime;
  final String endtime;
  final String imageString;
  final Color themeColor;
}
