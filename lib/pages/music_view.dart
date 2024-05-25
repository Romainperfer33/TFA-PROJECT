import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicView extends StatefulWidget {
  const MusicView({Key? key}) : super(key: key);

  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  Future<void> _playMusic() async {
    await _audioPlayer.setSource(AssetSource('theme.mp3'));
    _audioPlayer.resume();
  }

  Future<void> _pauseMusic() async {
    _audioPlayer.pause();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "T F A",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _playMusic,
                icon: const Icon(Icons.play_arrow),
                label: const Text("Play"),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _pauseMusic,
                icon: const Icon(Icons.pause),
                label: const Text("Pause"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
