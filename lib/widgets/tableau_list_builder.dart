import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/radio_tableau.dart';
import 'package:school_sr_tableau/views/tableau_list_cell_view.dart';

class TableauListBuilder extends StatelessWidget {
  const TableauListBuilder({required this.tableau, super.key});

  final List<RadioTableau> tableau;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: tableau.length,
      itemBuilder: (ctx, index) => TableauListCellView(tableau[index]),
    );
  }
}
