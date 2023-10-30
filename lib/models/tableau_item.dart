import 'package:flutter/material.dart';

class TableauItem {
  TableauItem({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endtime,
    required this.imageUrl,
  });

  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endtime;
  final Image imageUrl;
}
