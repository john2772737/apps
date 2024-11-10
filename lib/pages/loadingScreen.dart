import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color here
        child: Center(
          child: Lottie.asset(
            'assets/catloading.json', // path to your Lottie JSON file
            width: 200, // 50% of screen width
            height: 200, // 30% of screen height
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
