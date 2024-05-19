import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: FadeInTextWithButton(),
        ),
      ),
    );
  }
}

class FadeInTextWithButton extends StatefulWidget {
  const FadeInTextWithButton({Key? key}) : super(key: key);

  @override
  _FadeInTextWithButtonState createState() => _FadeInTextWithButtonState();
}

class _FadeInTextWithButtonState extends State<FadeInTextWithButton> {
  double _opacity = 0.0;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          _showButton = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeIn,
          child: const Text(
            "T F A ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        AnimatedOpacity(
          opacity: _showButton ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              "TRY THE EXPERIENCE",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
