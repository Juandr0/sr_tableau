import 'package:flutter/widgets.dart';
import 'package:school_sr_tableau/models/radio_channel.dart';
import 'package:school_sr_tableau/views/channel_list_cell_view.dart';
import 'data_fetcher.dart';
import 'package:flutter/material.dart';

class ChannelListBuilder extends StatelessWidget {
  ChannelListBuilder({super.key});
  final DataFetcher dataFetcher = DataFetcher();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RadioChannel>>(
      future: dataFetcher.fetchAllRadioChannels(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final List<RadioChannel> channels = snapshot.data!;
            return ListView.builder(
              itemCount: channels.length,
              itemBuilder: (ctx, index) => ChannelListCellView(channels[index]),
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
