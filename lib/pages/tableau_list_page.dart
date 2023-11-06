import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/radio_tableau.dart';
import 'package:school_sr_tableau/pages/cells/tableau_list_cell_view.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';

class TableauListPage extends StatefulWidget {
  const TableauListPage({required this.channel, this.channelId, super.key});

  final String? channel;
  final int? channelId;

  @override
  State<StatefulWidget> createState() => _TableauListPageState();
}

class _TableauListPageState extends State<TableauListPage> {
  final AudioPlayer radioPlayer = AudioPlayer();
  final dataFetcher = DataFetcher();
  late RadioTableau radioTableau;
  bool isPlaying = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sveriges Radio idag"),
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
      body: FutureBuilder<List<RadioTableau>>(
        future: dataFetcher.fetchRadioChannelSchedule(
            widget.channel!, widget.channelId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<RadioTableau> tempList = snapshot.data!;
              return ListView.builder(
                  itemCount: tempList.length,
                  itemBuilder: (ctx, index) {
                    radioTableau = tempList[index];
                    return TableauListCellView(tempList[index]);
                  });
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
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
