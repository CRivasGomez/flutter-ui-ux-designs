import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:party_finding/src/page/onboarding_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
  );

  runApp(PartyFindingApp());
}

class PartyFindingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party Finding',
      home: OnboardingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
