import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/tableau.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';
import 'package:school_sr_tableau/widgets/tableau_list_builder.dart';
import 'package:school_sr_tableau/bottom_navbar.dart';
import 'package:audioplayers/audioplayers.dart';

class TableauView extends StatefulWidget {
  const TableauView({super.key});

  @override
  State<TableauView> createState() => _TableauViewState();
}

class _TableauViewState extends State<TableauView> {
  final dataFetcher = DataFetcher();
  final AudioPlayer radioPlayer = AudioPlayer();
  List<Tableau> tableau = [];

  bool isPlaying = false;
  int _selectedIndex = 0;

  List<String> radioUrl = [
    'https://sverigesradio.se/topsy/direkt/srapi/132.mp3',
    'https://sverigesradio.se/topsy/direkt/srapi/163.mp3',
    'https://sverigesradio.se/topsy/direkt/srapi/164.mp3',
  ];

  @override
  void initState() {
    super.initState();
    _onNavIconTapped(_selectedIndex);
  }

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
      body: Center(
        child: TableauListBuilder(tableau: tableau),
      ),
      bottomNavigationBar: BottomNavBar(
        onItemTapped: _onNavIconTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  void _toggleRadioPlayer() async {
    isPlaying
        ? radioPlayer.stop()
        : await radioPlayer.play(
            UrlSource(radioUrl[_selectedIndex]),
          );

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _onNavIconTapped(channelIndex) async {
    if (isPlaying) {
      _toggleRadioPlayer();
    }
    setState(() {
      tableau = [];
      _selectedIndex = channelIndex;
    });

    final fetchResponse = await dataFetcher.fetchFromApi(_selectedIndex);
    setState(() {
      tableau.addAll(fetchResponse);
    });
  }
}
