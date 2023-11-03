import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/radio_channel.dart';
import 'package:school_sr_tableau/models/radio_tableau.dart';
import 'package:school_sr_tableau/widgets/tableau_list_builder.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';

class ChannelListCellView extends StatelessWidget {
  ChannelListCellView(this.channel, {super.key});

  final RadioChannel channel;
  final DataFetcher dataFetcher = DataFetcher();
  final Size imageSize = const Size(40, 40);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          List<RadioTableau> tableau =
              await dataFetcher.fetchRadioChannelSchedule(0, channel.id);
          _navigateToTableauList(context, tableau, channel);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/p4.png',
                width: imageSize.width,
                height: imageSize.height,
              ),
              Text(channel.title),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToTableauList(
      BuildContext context, List<RadioTableau> tableau, RadioChannel channel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(channel.title),
          ),
          body: TableauListBuilder(tableau: tableau),
        ),
      ),
    );
  }
}
