import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/radio_tableau.dart';
import 'dart:async';
import 'package:school_sr_tableau/app_theme.dart';
import 'package:school_sr_tableau/pages/tableau_list_page.dart';

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

  void updateProgressBarTimer() {
    // Called once outside the timer to update the UI upon displaying the view
    updateProgressBar();
    var updateDuration = const Duration(seconds: 3);

    Timer.periodic(updateDuration, (timer) {
      updateProgressBar();
    });
  }

  void updateProgressBar() {
    final now = DateTime.now();
    final startTime = _parseTime(widget.tableau.startTime, now);
    final endTime = _parseTime(widget.tableau.endTime, now);

    if (now.isBefore(startTime)) {
      progress = 0.0;
    } else if (now.isAfter(endTime)) {
      progress = 1.0;
    } else {
      final timePassed = now.difference(startTime).inMinutes;
      final totalDuration = endTime.difference(startTime).inMinutes;
      progress = timePassed / totalDuration;
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = _getSelectedTheme(widget.themeType);
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
        side: BorderSide(
          color: progress > 0 && progress < 1
              ? currentTheme.primaryColor
              : currentTheme.primaryColor.withAlpha(0),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            SizedBox(
              width: 200,
              child: Center(
                child: Text(
                  widget.tableau.title,
                  style: titleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.tableau.startTime),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  child: LinearProgressIndicator(
                    value: progress,
                    color: currentTheme.primaryColor,
                    backgroundColor: currentTheme.primaryColor.withAlpha(150),
                  ),
                ),
                const Spacer(),
                Text(widget.tableau.endTime),
              ],
            ),
          ],
        ),
      ),
    );
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
