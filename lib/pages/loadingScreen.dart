import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white.withOpacity(0.5), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/catloading.json', 
                width: 200, // 50% of screen width
                height: 200, // 30% of screen height
                fit: BoxFit.fill,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'We Vibe',
                        textStyle: TextStyle(
                          fontSize: 40.0,
                          color: Color(0xFFA33BD1), 
                          fontFamily: 'Lemon',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    totalRepeatCount: 8, 
                    isRepeatingAnimation: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
