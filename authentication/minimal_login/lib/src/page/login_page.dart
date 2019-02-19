import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onTapLogo;

  const LoginPage({Key key, this.onTapLogo}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _oscurePassword = true;

  void _handleOnPressedOscurePassword() {
    setState(() => _oscurePassword = !_oscurePassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 32, top: 48),
            height: 50,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'lib/resources/images/logo.png',
                    fit: BoxFit.fill,
                  ),
                  onTap: widget.onTapLogo,
                ),
              ],
            ),
          ),
          SizedBox(height: 48),
          Container(
            margin: EdgeInsets.only(left: 32),
            child: Row(
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.only(left: 32),
            child: Row(
              children: <Widget>[
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).textTheme.subtitle.color,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.only(left: 32),
            child: Row(
              children: <Widget>[
                Text(
                  'Please login to your account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).textTheme.subtitle.color,
                  ),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(left: 32),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'EMAIL',
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Container(
            margin: EdgeInsets.only(left: 32),
            child: TextField(
              obscureText: _oscurePassword,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 8),
                labelText: 'PASSWORD',
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: GestureDetector(
                  onTap: _handleOnPressedOscurePassword,
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Icon(
                      (_oscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: Theme.of(context).textTheme.body2.color,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 64),
          Container(
            margin: EdgeInsets.only(left: 32),
            child: CupertinoButton(
              onPressed: () => {},
              pressedOpacity: 0.8,
              borderRadius: BorderRadius.all(Radius.circular(0)),
              padding:
                  EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
              color: Theme.of(context).buttonColor,
              child: Row(
                children: <Widget>[
                  Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 14),
                  ),
                  Expanded(child: Container()),
                  Image.asset(
                    'lib/resources/images/arrow-right-alt.png',
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Row(
              children: <Widget>[
                CupertinoButton(
                  onPressed: () => {},
                  child: Text(
                    'FORGOT PASSWORD?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 48),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              color: Theme.of(context).bottomAppBarColor,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Don´t have an account?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.body1.color
                  ),
                ),
                Expanded(child: Container()),
                CupertinoButton(
                  onPressed: () => {},
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
