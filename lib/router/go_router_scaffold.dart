import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_sr_tableau/custom_nav_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:school_sr_tableau/models/radio_tableau.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';

///Sets the appbar and navbar
class GoRouterScaffold extends StatefulWidget {
  const GoRouterScaffold({required this.child, super.key});

  final Widget child;
  @override
  State<GoRouterScaffold> createState() => _GoRouterScaffoldState();
}

class _GoRouterScaffoldState extends State<GoRouterScaffold> {
  int currentIndex = 0;
  final AudioPlayer radioPlayer = AudioPlayer();
  final dataFetcher = DataFetcher();
  List<RadioTableau> tableau = [];
  List<String> radioUrl = [
    'https://http-live.sr.se/p1-mp3-128',
    'https://http-live.sr.se/p2-mp3-128',
    'https://http-live.sr.se/p3-mp3-128',
  ];

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sveriges Radio idag"),
        actions: [
          IconButton(
            onPressed: _toggleRadioPlayer,
            icon: isPlaying
                ? const Icon(Icons.stop)
                : const Icon(Icons.play_arrow),
          )
        ],
      ),
      body: widget.child,
      bottomNavigationBar: CustomNavBar(
        selectedIndex: currentIndex,
        onItemTapped: changeTab,
      ),
    );
  }

  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go('/p1');
        break;
      case 1:
        context.go('/p2');
        break;
      case 2:
        context.go('/p3');
        break;
      case 3:
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

  // void _onNavIconTapped(channelIndex) async {
  //   if (isPlaying) {
  //     _toggleRadioPlayer();
  //   }
  //   setState(() {
  //     tableau = [];
  //     currentIndex = channelIndex;
  //   });
  //   if (currentIndex != 3) {
  //     final fetchResponse =
  //         await dataFetcher.fetchRadioChannelSchedule(currentIndex, null);
  //     setState(() {
  //       tableau.addAll(fetchResponse);
  //     });
  //   }
  // }

  void _toggleRadioPlayer() async {
    isPlaying
        ? radioPlayer.stop()
        : await radioPlayer.play(
            UrlSource(radioUrl[currentIndex]),
          );

    setState(() {
      isPlaying = !isPlaying;
    });
  }
}
