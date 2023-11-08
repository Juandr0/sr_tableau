import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/radio_tableau.dart';
import 'package:school_sr_tableau/views/cells/tableau_list_cell_view.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';

enum ThemeType { p1, p2, p3, p4 }

class TableauListPage extends StatefulWidget {
  const TableauListPage(
      {required this.channel,
      this.channelId,
      required this.colorTheme,
      super.key});

  final String? channel;
  final int? channelId;
  final ThemeType colorTheme;

  @override
  State<StatefulWidget> createState() => _TableauListPageState();
}

class _TableauListPageState extends State<TableauListPage> {
  final AudioPlayer radioPlayer = AudioPlayer();
  final dataFetcher = DataFetcher();
  late RadioTableau radioTableau;
  List<RadioTableau> dataList = [];

  bool isPlaying = false;
  String appBarTitle = '';
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdateAppBarTitle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: [
          currentIndex != 3
              ? IconButton(
                  onPressed: toggleRadioPlayer,
                  icon: isPlaying
                      ? const Icon(Icons.stop)
                      : const Icon(Icons.play_arrow),
                )
              : Container()
        ],
      ),
      body: dataList.isNotEmpty
          ? ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (ctx, index) {
                return TableauListCellView(dataList[index], widget.colorTheme);
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  void updateAppBarTitle(String title) {
    setState(() {
      appBarTitle = title;
    });
  }

  void fetchDataAndUpdateAppBarTitle() {
    dataFetcher
        .fetchRadioChannelSchedule(widget.channel!, widget.channelId)
        .then((List<RadioTableau> tempList) {
      if (tempList.isNotEmpty) {
        radioTableau = tempList[0];
        updateAppBarTitle(radioTableau.channelName);
        setState(() {
          dataList = tempList;
        });
      }
    }).catchError((error) {
      print("Error: $error");
    });
  }

  @override
  void dispose() {
    radioPlayer.stop();
    super.dispose();
  }

  void toggleRadioPlayer() async {
    isPlaying
        ? radioPlayer.stop()
        : await radioPlayer.play(
            UrlSource(radioTableau.playerUrl),
          );
    setState(() {
      isPlaying = !isPlaying;
    });
  }
}
