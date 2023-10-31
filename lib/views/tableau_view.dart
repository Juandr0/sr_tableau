import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';
import 'package:school_sr_tableau/widgets/tableau_list_builder.dart';
import 'package:school_sr_tableau/bottom_navbar.dart';
import 'package:intl/intl.dart';

class TableauView extends StatefulWidget {
  const TableauView({super.key});

  @override
  State<TableauView> createState() => _TableauViewState();
}

class _TableauViewState extends State<TableauView> {
  final apiFetcher = DataFetcher();
  final todaysDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final int _animationTime = 500;

  int _selectedIndex = 0;
  int _currentChannel = 0;
  int _pagination = 1;

  List<Tableau> tableau = [];
  Color appBackgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _onItemTapped(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        title: const Text("Sveriges Radio"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: _animationTime),
          color: appBackgroundColor,
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
    if (_currentChannel != channelIndex) {
      setState(() {
        tableau = [];
        _currentChannel = channelIndex;
        _pagination = 1;
      });
    }

    setState(() {
      _selectedIndex = channelIndex;
    });

    String fetchUrl = getFetchUrl(_selectedIndex);
    final fetchResponse = await apiFetcher.fetchFromApi(fetchUrl);
    print(fetchUrl);
    setState(() {
      tableau.addAll(fetchResponse);
      appBackgroundColor = Tableau.tableauColors[_selectedIndex];
      _pagination++;
    });
  }

  String getFetchUrl(index) {
    switch (index) {
      case 0:
        setState(() {
          _currentChannel = 0;
        });
        return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=132&format=json&page=$_pagination&fromdate$todaysDate';

      case 1:
        setState(() {
          _currentChannel = 1;
        });
        return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=163&format=json&page=$_pagination&fromdate$todaysDate';

      case 2:
        setState(() {
          _currentChannel = 2;
        });
        return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=164&format=json&page=$_pagination&fromdate$todaysDate';
    }
    return '';
  }
}
