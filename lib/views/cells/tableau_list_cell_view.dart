import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/radio_tableau.dart';
import 'dart:async';
import 'package:school_sr_tableau/app_theme.dart';
import 'package:school_sr_tableau/views/tableau_list_page.dart';
import 'tableau_card.dart';

class TableauListCellView extends StatefulWidget {
  const TableauListCellView(this.tableau, this.themeType, {super.key});

  final RadioTableau tableau;
  final ThemeType themeType;

  @override
  State<TableauListCellView> createState() => _TableauItemViewState();
}

class _TableauItemViewState extends State<TableauListCellView> {
  final imageSize = const Size(40, 40);
  final titleTextStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    updateProgressBarTimer();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = _getSelectedTheme(widget.themeType);
    var themeColor = _getThemedColor(currentTheme);
    return TableauCard(
      progress: progress,
      themeColor: themeColor,
      widget: widget,
      titleTextStyle: titleTextStyle,
    );
  }

  void updateProgressBarTimer() {
    // Called once outside the timer to update the UI upon displaying the view
    updateProgressBar();
    var updateDuration = const Duration(seconds: 5);

    Timer.periodic(updateDuration, (timer) {
      updateProgressBar();
    });
  }

  void updateProgressBar() {
    final now = DateTime.now();
    final startTime = _parseTime(widget.tableau.startTime, now);
    DateTime endTime = _parseTime(widget.tableau.endTime, now);

    if (now.isBefore(startTime)) {
      progress = 0.0;
    } else if (now.isAfter(endTime)) {
      progress = 1.0;
    } else {
      if (endTime == DateTime(now.year, now.month, now.day, 0, 0)) {
        endTime = DateTime(
            now.year, now.month, now.day, 23, 59, 59); // Set it to 23:59:59
      }
      final timePassed = now.difference(startTime).inSeconds;
      final totalDuration = endTime.difference(startTime).inSeconds;

      progress = timePassed / totalDuration;
    }

    if (mounted) {
      setState(() {});
    }
  }

  Color _getThemedColor(ThemeData currentTheme) {
    final themeMode = MediaQuery.of(context).platformBrightness;
    if (themeMode == Brightness.light) {
      return progress > 0
          ? currentTheme.primaryColor
          : currentTheme.primaryColor.withAlpha(0);
    } else {
      return Colors.grey;
    }
  }

  ThemeData _getSelectedTheme(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.p1:
        return AppTheme.p1();
      case ThemeType.p2:
        return AppTheme.p2();
      case ThemeType.p3:
        return AppTheme.p3();
      case ThemeType.p4:
        return AppTheme.p4();
      default:
        return AppTheme.p1();
    }
  }

  DateTime _parseTime(String time, DateTime now) {
    final parts = time.split(':');
    if (parts.length == 2) {
      final hours = int.parse(parts[0]);
      final minutes = int.parse(parts[1]);
      return DateTime(now.year, now.month, now.day, hours, minutes);
    }
    return DateTime.now();
  }
}
