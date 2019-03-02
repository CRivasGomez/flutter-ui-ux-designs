import 'package:animated_background/src/custom_button.dart';
import 'package:animated_background/src/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  AnimationController _signUpAnimationController;
  Animation<double> _signUpAnimation;

  AnimationController _signInAnimationController;
  Animation<double> _signInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));

    _signUpAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _signInAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });

    Future.delayed(Duration.zero, () {
      _signUpAnimation =
          Tween(begin: MediaQuery.of(context).size.height, end: 450.0).animate(
              _signUpAnimationController
                  .drive(CurveTween(curve: Curves.easeOut)))
            ..addListener(() {
              setState(() {});
            })
            ..addStatusListener((animationStatus) {
              if (animationStatus == AnimationStatus.completed) {
                _signInAnimationController.forward();
              }
            });

      _signInAnimation = Tween(begin: -32.0, end: 16.0).animate(
          _signInAnimationController.drive(CurveTween(curve: Curves.easeOut)))
        ..addListener(() {
          setState(() {});
        });
    });

    _animationController.forward();

    _signUpAnimationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() {
    _handleOnTabBackButton();
    return Future.delayed(Duration.zero, () {
      _handleOnTabBackButton();
    });
  }

  void _handleOnTabBackButton() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) => OnboardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Image.asset(
              'lib/resources/images/background.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: FractionalOffset(_animation.value, 0),
            ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Image.asset(
                            'lib/resources/images/icon-back.png',
                            fit: BoxFit.cover,
                            width: 32,
                            height: 32,
                          ),
                          onTap: _handleOnTabBackButton,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 48),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: _signUpAnimation?.value ?? double.maxFinite,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 300,
                    child: CustomButton(
                      text: 'Sign Up',
                      highlight: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 280,
                        child: Text(
                          'By creating an account you agree to our',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CupertinoButton(
                              onPressed: () => {},
                              padding: EdgeInsets.all(0),
                              child: Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              'and',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            SizedBox(width: 2),
                            CupertinoButton(
                              onPressed: () => {},
                              padding: EdgeInsets.all(0),
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: _signInAnimation?.value ?? -32.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 2),
                  CupertinoButton(
                    onPressed: () => {},
                    padding: EdgeInsets.all(0),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
