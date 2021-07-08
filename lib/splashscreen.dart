import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:inventory/pages/HomePage.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedSplashScreen(
          splash: LottieBuilder.asset('assets/logistic.json',
              height: 150, width: 150, fit: BoxFit.fitWidth),
          nextScreen: HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white12,
          // duration: 1800,
        ),
      ),
    );
  }
}
