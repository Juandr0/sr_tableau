import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: selectedIndex,
      selectedItemColor: Tableau.tableauColors[selectedIndex],
      onTap: onItemTapped,
    );
  }
}
