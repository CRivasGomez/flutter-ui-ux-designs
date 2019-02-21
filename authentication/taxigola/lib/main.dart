import 'package:flutter/material.dart';
import 'package:taxigola/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxigola',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
