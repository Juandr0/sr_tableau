import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';
import 'package:school_sr_tableau/widgets/tableau_item.dart';

class TableauListBuilder extends StatelessWidget {
  const TableauListBuilder({required this.tableau, super.key});

  final List<Tableau> tableau;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: tableau.length,
      itemBuilder: (ctx, index) => TableauItem(tableau[index]),
    );
  }
}
