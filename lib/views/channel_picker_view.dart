import 'package:flutter/widgets.dart';

class ChannelPickerView extends StatefulWidget {
  const ChannelPickerView({super.key});

  @override
  State<StatefulWidget> createState() => _ChannelPickerViewState();
}

class _ChannelPickerViewState extends State<ChannelPickerView> {
  @override
  Widget build(context) {
    return const Column(
      children: [
        Text('P4 Blekinge - Program test 123 413 '),
      ],
    );
  }
}
