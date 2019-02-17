import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:party_finding/src/domain/slide.dart';

class OnboardingPage extends StatefulWidget {
  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  int _currentPage;
  List<Slide> _slides;
  PageController _pageController;

  @override
  void initState() {
    _currentPage = 0;
    _slides = [
      Slide(
        'lib/resources/images/slide-1.png',
        'Find the perfect party for you and your friends',
        'Search the parties available and filter by location, mood and kind of music',
      ),
      Slide(
        'lib/resources/images/slide-2.png',
        'Meet new people and have fun with them',
        'Go to the party and meet new people who know how to have fun',
      ),
      Slide(
        'lib/resources/images/slide-3.png',
        'Free the Dua Lipa that is inside you',
        'Jump on the coach and free all the electricity inside you',
      ),
    ];
    _pageController = PageController(initialPage: _currentPage);
  }

  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  Widget _buildSlide(Slide slide) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Text(
            slide.heading,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              width: 120,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(127, 0, 255, 1),
                  Color.fromRGBO(207, 0, 255, 1),
                ]),
                color: Colors.purple,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Image.asset(
              slide.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 48),
          child: Text(
            slide.body,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 230),
      ],
    );
  }

  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);

    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1) row.children.add(SizedBox(width: 12));
    }

    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage
            ? Color.fromRGBO(207, 0, 255, 1)
            : Color.fromRGBO(200, 200, 200, 1),
      ),
    );
  }

  Widget _buildSkipNextButtons() {
    if (_currentPage != _slides.length - 1) {
      return Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 32),
            child: CupertinoButton(
              onPressed: _handleOnPressedSkip,
              child: Text(
                'SKIP',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(right: 32),
            child: CupertinoButton(
              onPressed: _handleOnPressedNext,
              child: Text(
                'NEXT',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(207, 0, 255, 1),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildCTAButton() {
    if (_currentPage == _slides.length - 1) {
      return GradientButton(
        callback: () => {},
        child: Text(
          'PARTY!',
          style: TextStyle(
            fontFamily: 'LemonMilk',
            fontSize: 12,
            letterSpacing: 4,
          ),
        ),
        increaseWidthBy: 120,
        increaseHeightBy: 8,
        gradient: LinearGradient(colors: [
          Color.fromRGBO(127, 0, 255, 1),
          Color.fromRGBO(207, 0, 255, 1),
        ]),
        shapeRadius: BorderRadius.circular(32),
      );
    } else {
      return Container();
    }
  }

  void _handleOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  void _handleOnPressedSkip() {
    _pageController.animateToPage(
      _slides.length - 1,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _handleOnPressedNext() {
    _pageController.animateToPage(
      _currentPage + 1,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: _handleOnPageChanged,
              physics: BouncingScrollPhysics(),
              children: _buildSlides(),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 190,
              child: _buildPageIndicator(),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 32,
              child: _buildSkipNextButtons(),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 32,
              child: _buildCTAButton(),
            ),
//            Positioned(
//              left: 0,
//              right: 0,
//              bottom: 0,
//              child: Column(
//                children: <Widget>[
//                  _buildPageIndicator(),
//                  SizedBox(height: 110),
//                  _buildSkipNextButtons(),
//                  _buildCTAButton(),
//                  SizedBox(height: 32),
//                ],
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
