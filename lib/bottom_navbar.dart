import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_sr_tableau/models/tableau.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final TextStyle selectedStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
  );

  final TextStyle unselectedStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.normal,
  );

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
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/p4.png',
            width: 40,
            height: 40,
          ),
          label: 'P4',
        ),
      ],

      currentIndex: selectedIndex,
      onTap: onItemTapped,
      //Icon color styling
      selectedLabelStyle: selectedStyle,
      unselectedLabelStyle: unselectedStyle,
      selectedItemColor: Tableau.tableauColors[selectedIndex],
    );
  }
}
