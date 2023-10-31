import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';
import 'package:school_sr_tableau/widgets/tableau_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text("P1"),
    Text("P2"),
    Text("P3"),
  ];

  final List<Tableau> tableau = [
    Tableau(
        title: 'Test titel 1',
        description: 'Test1',
        startTime: DateTime.now(),
        endtime: DateTime.now(),
        imageString:
            'https://static-cdn.sr.se/images/2689/0a92a699-d655-4f50-8606-8b2c150d6a03.jpg?preset=api-default-square'),
    Tableau(
        title: 'Test titel 2',
        description: 'Test2',
        startTime: DateTime.now(),
        endtime: DateTime.now(),
        imageString:
            'https://static-cdn.sr.se/images/2689/0a92a699-d655-4f50-8606-8b2c150d6a03.jpg?preset=api-default-square'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sveriges Radio"),
      ),
      body: Center(
          // child: _widgetOptions.elementAt(_selectedIndex),
          child: Column(
        children: [Expanded(child: TableauListBuilder(tableau: tableau))],
      )),
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
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
