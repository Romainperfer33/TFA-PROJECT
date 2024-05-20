import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicView extends StatelessWidget {
  const MusicView({super.key});

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
          child: ElevatedButton(
            onPressed: () {
              final player = AudioCache();
              player.play('theme.mp3');
            },
            child: const Text("Click Me"),
          ),
        ),
      ),
    );
  }
}
