import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_sr_tableau/widgets/custom_nav_bar.dart';

///Sets the appbar and navbar
class GoRouterScaffold extends StatefulWidget {
  const GoRouterScaffold({required this.child, super.key});

  final Widget child;

  @override
  State<GoRouterScaffold> createState() => _GoRouterScaffoldState();
}

class _GoRouterScaffoldState extends State<GoRouterScaffold> {
  String title = "Sveriges Radio idag: P1";
  int currentIndex = 0;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CustomNavBar(
        selectedIndex: currentIndex,
        onItemTapped: changeTab,
      ),
    );
  }

  void changeTab(int index) {
    const String stringPrefix = 'Sveriges Radio idag:';

    switch (index) {
      case 0:
        title = '$stringPrefix P1';
        context.go('/p1');
        break;
      case 1:
        title = '$stringPrefix P2';
        context.go('/p2');
        break;
      case 2:
        title = '$stringPrefix P3';
        context.go('/p3');
        break;
      case 3:
        title = '$stringPrefix P4';
        context.go('/p4ChannelsList');
        break;
      case 4:
        context.go('/p4Channel');
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }
}
