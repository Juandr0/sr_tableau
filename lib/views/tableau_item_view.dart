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
              Text(tableau.startTime),
              const Spacer(),
              Text(tableau.endTime),
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
}
