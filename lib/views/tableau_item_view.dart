import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';

class TableauItemView extends StatelessWidget {
  const TableauItemView(this.tableau, {super.key});

  final Tableau tableau;

  @override
  Widget build(context) {
    final String formattedStartTime =
        formatTimeFromTimestampString(tableau.startTime);

    final String formattedEndTime =
        formatTimeFromTimestampString(tableau.endtime);

    return Card(
      color: const Color.fromARGB(255, 239, 239, 239),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(children: [
          Text(
            tableau.title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(formattedStartTime), // Display formatted start time
              const Spacer(), // implementera progressbar?
              Text(formattedEndTime),
              Image.network(
                tableau.imageString,
                width: 40,
                height: 40,
              )
            ],
          )
        ]),
      ),
    );
  }

  String formatTimeFromTimestampString(String timestampString) {
    final int startIndex = timestampString.indexOf('(') + 1;
    final int endIndex = timestampString.indexOf(')');
    if (startIndex >= 0 && endIndex >= 0) {
      final String timestampValue =
          timestampString.substring(startIndex, endIndex);
      final int timestamp = int.parse(timestampValue);
      final DateTime date =
          DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);
      final String formattedTime =
          '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
      return formattedTime;
    }
    return '';
  }
}
