import 'package:animated_background/src/onboarding_page.dart';
import 'package:animated_background/src/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(AnimatedBackground());
}

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Background',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
