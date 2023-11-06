import 'package:school_sr_tableau/models/radio_channel.dart';
import 'package:school_sr_tableau/models/channel_list_cell_view.dart';
import '../widgets/data_fetcher.dart';
import 'package:flutter/material.dart';

class ChannelListPage extends StatefulWidget {
  const ChannelListPage({super.key});
  @override
  State<StatefulWidget> createState() => _ChannelListBuilder();
}

class _ChannelListBuilder extends State<ChannelListPage> {
  final DataFetcher dataFetcher = DataFetcher();
  List<RadioChannel> sortedChannels = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RadioChannel>>(
      future: dataFetcher.fetchAllP4Channels(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final List<RadioChannel> channels = snapshot.data!;
            sortedChannels = [...channels];
            sortedChannels.sort((a, b) => a.title.compareTo(b.title));
            return ListView.builder(
              itemCount: sortedChannels.length,
              itemBuilder: (ctx, index) =>
                  ChannelListCellView(sortedChannels[index]),
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
