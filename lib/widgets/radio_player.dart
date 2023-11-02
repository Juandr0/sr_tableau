import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({required this.radioIndex, super.key});
  final int radioIndex;

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  String audioPlayerUrl = 'https://sverigesradio.se/topsy/direkt/srapi/132.mp3';
  AudioPlayer audioPlayer = AudioPlayer();
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
        ? audioPlayer.stop()
        : await audioPlayer.play(
            UrlSource(audioPlayerUrl),
          );

    setState(() {
      isPlaying = !isPlaying;
    });
  }
}
