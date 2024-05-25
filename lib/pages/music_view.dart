import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

class MusicView extends StatefulWidget {
  const MusicView({Key? key}) : super(key: key);

  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  late AudioPlayer _audioPlayer;
  Timer? _vibrationTimer;
  final int _tempo = 140;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  Future<void> _playMusic() async {
    await _audioPlayer.setSource(AssetSource('theme.mp3'));
    _audioPlayer.resume();

    int interval = (60000 / _tempo).round();

    _vibrationTimer = Timer.periodic(Duration(milliseconds: interval), (timer) {
      Vibration.vibrate(duration: 50);
    });
  }

  Future<void> _pauseMusic() async {
    _audioPlayer.pause();
    _vibrationTimer?.cancel();
  }

  Future<void> _rewindMusic() async {
    await _audioPlayer.seek(Duration.zero);
    _audioPlayer.resume();

    int interval = (60000 / _tempo).round();

    _vibrationTimer?.cancel();
    _vibrationTimer = Timer.periodic(Duration(milliseconds: interval), (timer) {
      Vibration.vibrate(duration: 50);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _vibrationTimer?.cancel();
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
                icon: const Icon(Icons.play_arrow, color: Colors.black),
                label: const Text(
                  "Play",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _pauseMusic,
                icon: const Icon(Icons.pause, color: Colors.black),
                label: const Text(
                  "Pause",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _rewindMusic,
                icon: const Icon(Icons.replay, color: Colors.black),
                label: const Text(
                  "Rewind",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
