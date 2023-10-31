import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';
import 'package:school_sr_tableau/widgets/tableau_list_builder.dart';

class TableauView extends StatefulWidget {
  const TableauView({super.key});

  @override
  State<TableauView> createState() => _TableauViewState();
}

class _TableauViewState extends State<TableauView> {
  final apiFetcher = DataFetcher();
  int _selectedIndex = 0;
  int _currentChannel = 0;
  int _pagination = 1;
  List<Tableau> tableau = [];

  @override
  void initState() {
    super.initState();
    _onItemTapped(_selectedIndex);
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

    String fetchUrl = '';
    switch (_selectedIndex) {
      case 0:
        fetchUrl =
            'https://api.sr.se/api/v2/scheduledepisodes?channelid=132&format=json&page=$_pagination';
        setState(() {
          _currentChannel = 0;
        });
        break;

      case 1:
        fetchUrl =
            'https://api.sr.se/api/v2/scheduledepisodes?channelid=163&format=json&page=$_pagination';
        setState(() {
          _currentChannel = 1;
        });
        break;

      case 2:
        fetchUrl =
            'https://api.sr.se/api/v2/scheduledepisodes?channelid=164&format=json&page=$_pagination';
        setState(() {
          _currentChannel = 2;
        });
        break;
    }

    final fetchResponse =
        await apiFetcher.fetchFromApi(fetchUrl, _currentChannel);

    setState(() {
      tableau.addAll(fetchResponse);
      _pagination++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sveriges Radio"),
      ),
      body: Center(
        child: TableauListBuilder(tableau: tableau),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/p1.png',
              width: 40,
              height: 40,
            ),
            label: 'P1',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/p2.png',
              width: 40,
              height: 40,
            ),
            label: 'P2',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/p3.png',
              width: 40,
              height: 40,
            ),
            label: 'P3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: <Color>[
          Colors.blue, // Color for P1
          Colors.amber, // Color for P2
          Colors.green, // Color for P3
        ][_selectedIndex],
        onTap: _onItemTapped,
      ),
    );
  }
}
