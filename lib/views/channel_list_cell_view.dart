import 'package:flutter/material.dart';
import 'package:school_sr_tableau/models/radio_channel.dart';

class ChannelListCellView extends StatelessWidget {
  const ChannelListCellView(this.channel, {super.key});

  final RadioChannel channel;

  @override
  Widget build(context) {
    return Text(channel.title);
  }
}
