import 'package:flutter/material.dart';
import 'package:school_sr_tableau/views/tableau_view.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Color.fromARGB(255, 62, 6, 130),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const TableauView(),
    ),
  );
}
