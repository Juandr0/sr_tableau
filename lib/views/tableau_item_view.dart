import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';

class TableauItemView extends StatelessWidget {
  const TableauItemView(this.tableau, {super.key});

  final Tableau tableau;

  @override
  Widget build(context) {
    return Card(
      color: const Color.fromARGB(255, 239, 239, 239),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(children: [
          Row(
            children: [
              Text(tableau.title),
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
