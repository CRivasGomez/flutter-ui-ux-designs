import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimal_login/src/page/login_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
  );

  runApp(MinimalLoginApp());
}

class MinimalLoginApp extends StatefulWidget {
  @override
  MinimalLoginAppState createState() => MinimalLoginAppState();
}

class MinimalLoginAppState extends State<MinimalLoginApp> {
  ThemeData _customLightTheme = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(color: Color.fromRGBO(42, 48, 54, 1)),
          subtitle: TextStyle(color: Color.fromRGBO(106, 110, 114, 1)),
          body1: TextStyle(color: Color.fromRGBO(131, 142, 157, 1)),
          body2: TextStyle(color: Color.fromRGBO(213, 214, 215, 1)),
        ),
    buttonColor: Color.fromRGBO(8, 101, 236, 1),
    accentColor: Color.fromRGBO(36, 104, 228, 1),
    primaryColor: Color.fromRGBO(36, 104, 228, 1),
    dividerColor: Color.fromRGBO(199, 199, 199, 1),
    bottomAppBarColor: Color.fromRGBO(239, 242, 246, 1),
  );

  ThemeData _customDarkTheme = ThemeData.dark().copyWith(
    backgroundColor: Color.fromRGBO(39, 50, 64, 1),
    textTheme: ThemeData.dark().textTheme.copyWith(
          title: TextStyle(color: Color.fromRGBO(249, 249, 250, 1)),
          subtitle: TextStyle(color: Color.fromRGBO(186, 189, 195, 1)),
          body1: TextStyle(color: Color.fromRGBO(148, 161, 176, 1)),
          body2: TextStyle(color: Color.fromRGBO(54, 67, 83, 1)),
        ),
    buttonColor: Color.fromRGBO(55, 134, 246, 1),
    accentColor: Color.fromRGBO(72, 135, 238, 1),
    primaryColor: Color.fromRGBO(72, 135, 238, 1),
    dividerColor: Color.fromRGBO(48, 63, 79, 1),
    bottomAppBarColor: Color.fromRGBO(48, 63, 79, 1),
  );

  bool _useDarkTheme = true;

  void _switchTheme() {
    setState(() => _useDarkTheme = !_useDarkTheme);
  }

  void _handleOnPressedLogo() {
    _switchTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal Login',
      theme: (_useDarkTheme ? _customDarkTheme : _customLightTheme),
      home: LoginPage(onTapLogo: _handleOnPressedLogo),
      debugShowCheckedModeBanner: false,
    );
  }
}
