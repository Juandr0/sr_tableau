import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';

class TableauItemView extends StatelessWidget {
  const TableauItemView(this.tableau, {super.key});

  final imageSize = const Size(40, 40);
  final titleTextStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
  final Tableau tableau;

  @override
  Widget build(context) {
    final String formattedStartTime =
        formatTimeFromTimestampString(tableau.startTime);

    final String formattedEndTime =
        formatTimeFromTimestampString(tableau.endtime);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(children: [
          Text(
            tableau.title,
            style: titleTextStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formattedStartTime),
              const Spacer(),
              Text(formattedEndTime),
              const SizedBox(
                width: 20,
              ),
              Image.network(
                tableau.imageString,
                width: imageSize.width,
                height: imageSize.height,
              )
            ],
          ),
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

      final DateTime timeAsCET = date.add(const Duration(hours: 1));
      final String formattedTime =
          '${timeAsCET.hour.toString().padLeft(2, '0')}:${timeAsCET.minute.toString().padLeft(2, '0')}';
      return formattedTime;
    }
    return '';
  }
}
