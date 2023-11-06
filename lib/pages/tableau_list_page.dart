import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/radio_tableau.dart';
import 'package:school_sr_tableau/pages/cells/tableau_list_cell_view.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';

class TableauListPage extends StatelessWidget {
  TableauListPage({required this.channel, this.channelId, super.key});

  final String? channel;
  final int? channelId;

  final dataFetcher = DataFetcher();

  @override
  Widget build(context) {
    return FutureBuilder<List<RadioTableau>>(
      future: dataFetcher.fetchRadioChannelSchedule(channel!, channelId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final List<RadioTableau> tableau = snapshot.data!;
            return ListView.builder(
              itemCount: tableau.length,
              itemBuilder: (ctx, index) => TableauListCellView(tableau[index]),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
