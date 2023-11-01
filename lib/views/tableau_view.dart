import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';
import 'package:school_sr_tableau/widgets/tableau_list_builder.dart';
import 'package:school_sr_tableau/bottom_navbar.dart';

class TableauView extends StatefulWidget {
  const TableauView({super.key});

  @override
  State<TableauView> createState() => _TableauViewState();
}

class _TableauViewState extends State<TableauView> {
  final dataFetcher = DataFetcher();
  final int _animationTime = 500;
  List<Tableau> tableau = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _onItemTapped(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sveriges Radio idag"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: _animationTime),
          child: TableauListBuilder(tableau: tableau),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  void _onItemTapped(channelIndex) async {
    setState(() {
      tableau = [];
    });

    setState(() {
      _selectedIndex = channelIndex;
    });

    final fetchResponse = await dataFetcher.fetchFromApi(_selectedIndex);
    setState(() {
      tableau.addAll(fetchResponse);
      //appBackgroundColor = Tableau.tableauColors[_selectedIndex];
    });
  }
}
