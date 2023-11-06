import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_sr_tableau/models/radio_channel.dart';
import 'package:school_sr_tableau/widgets/data_fetcher.dart';

class ChannelListCellView extends StatelessWidget {
  ChannelListCellView(this.channel, {super.key});

  final RadioChannel channel;
  final DataFetcher dataFetcher = DataFetcher();
  final Size imageSize = const Size(40, 40);
  final p4Image = 'assets/images/p4.png';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.push('/p4Channel', extra: channel.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                p4Image,
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
}
