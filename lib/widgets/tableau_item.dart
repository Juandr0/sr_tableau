import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';

class TableauItem extends StatelessWidget {
  const TableauItem(this.tableau, {super.key});

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
          Text(tableau.title),
          Row(
            children: [
              Text(tableau.startTime.toString()),
              const Spacer(),
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
}
