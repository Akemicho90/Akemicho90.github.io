import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: AnimatedSplashScreen(
        splash: Image.asset('assets/icons/weatherlogo.png'),
        backgroundColor: Colors.blue.shade300,
        nextScreen: const LocationScreen(),
        splashIconSize: 200,
        duration: 4000,
        splashTransition: SplashTransition.fadeTransition,
      )
    );
  }
}
