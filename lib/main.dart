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
