// import 'package:flutter/material.dart';
// import 'package:school_sr_tableau/widgets/channel_list_builder.dart';
// import 'package:school_sr_tableau/widgets/tableau_list_builder.dart';
// import 'package:school_sr_tableau/custom_nav_bar.dart';
// import 'package:audioplayers/audioplayers.dart';

// class TableauView extends StatefulWidget {
//   const TableauView({super.key});

//   @override
//   State<TableauView> createState() => _TableauViewState();
// }

// class _TableauViewState extends State<TableauView> {
//   // final dataFetcher = DataFetcher();
//   // final AudioPlayer radioPlayer = AudioPlayer();
//   // List<RadioTableau> tableau = [];

//   bool isPlaying = false;
//   int _selectedIndex = 0;

//   // List<String> radioUrl = [
//   //   'https://http-live.sr.se/p1-mp3-128',
//   //   'https://http-live.sr.se/p2-mp3-128',
//   //   'https://http-live.sr.se/p3-mp3-128',
//   // ];

//   @override
//   void initState() {
//     super.initState();
//     // _onNavIconTapped(_selectedIndex);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text("Sveriges Radio idag"),
//       //   actions: [
//       //     IconButton(
//       //       onPressed: _toggleRadioPlayer,
//       //       icon: isPlaying
//       //           ? const Icon(Icons.stop)
//       //           : const Icon(Icons.play_arrow),
//       //     )
//       //   ],
//       // ),
//       body: Center(
//         child: _selectedIndex == 3
//             ? const ChannelListBuilder()
//             : TableauListBuilder(tableau: tableau),
//       ),
//       bottomNavigationBar: CustomNavBar(
//         onItemTapped: _onNavIconTapped,
//         selectedIndex: _selectedIndex,
//       ),
//     );
//   }

//   void _toggleRadioPlayer() async {
//     isPlaying
//         ? radioPlayer.stop()
//         : await radioPlayer.play(
//             UrlSource(radioUrl[_selectedIndex]),
//           );

//     setState(() {
//       isPlaying = !isPlaying;
//     });
//   }

//   // void _onNavIconTapped(channelIndex) async {
//   //   if (isPlaying) {
//   //     _toggleRadioPlayer();
//   //   }
//   //   setState(() {
//   //     tableau = [];
//   //     _selectedIndex = channelIndex;
//   //   });
//   //   if (_selectedIndex != 3) {
//   //     final fetchResponse =
//   //         await dataFetcher.fetchRadioChannelSchedule(_selectedIndex, null);
//   //     setState(() {
//   //       tableau.addAll(fetchResponse);
//   //     });
//   //   }
//   // }
// }
