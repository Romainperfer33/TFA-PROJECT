import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "T F A",
              style: TextStyle(
                color: Colors.white,
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fade(duration: 1.seconds).scale(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qrview');
              },
              child: const Text(
                "TRY THE EXPERIENCE",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ).animate().fade(delay: 2.seconds).scale(),
          ],
        ),
      ),
    );
  }
}
