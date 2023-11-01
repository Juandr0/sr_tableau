import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';
import 'dart:async';

class TableauItemView extends StatefulWidget {
  const TableauItemView(this.tableau, {Key? key}) : super(key: key);

  final Tableau tableau;

  @override
  State<TableauItemView> createState() => _TableauItemViewState();
}

class _TableauItemViewState extends State<TableauItemView> {
  final imageSize = const Size(40, 40);
  final titleTextStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
  Color cardColor = const Color.fromARGB(255, 165, 165, 165);

  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    updateProgress();
  }

  void updateProgress() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: ,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          children: [
            Text(
              widget.tableau.title,
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 5,
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
                    color: Theme.of(context).primaryColor,
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
