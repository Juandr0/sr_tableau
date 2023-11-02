import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({required this.radioIndex, super.key});

  static AudioPlayer audioPlayer = AudioPlayer();
  final int radioIndex;

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();

  void stop() {
    audioPlayer.stop();
  }
}

class _RadioPlayerState extends State<RadioPlayer> {
  List<String> audioPlayersUrl = [
    'https://sverigesradio.se/topsy/direkt/srapi/132.mp3',
    'https://sverigesradio.se/topsy/direkt/srapi/163.mp3',
    'https://sverigesradio.se/topsy/direkt/srapi/164.mp3',
  ];

  bool isPlaying = false;

  @override
  Widget build(context) {
    return IconButton(
      onPressed: _audioPlayerPressed,
      icon: isPlaying ? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
    );
  }

  void _audioPlayerPressed() async {
    isPlaying
        ? RadioPlayer.audioPlayer.stop()
        : await RadioPlayer.audioPlayer.play(
            UrlSource(audioPlayersUrl[widget.radioIndex]),
          );

    setState(() {
      isPlaying = !isPlaying;
    });
  }
}
