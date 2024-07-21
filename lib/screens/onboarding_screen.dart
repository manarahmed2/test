import 'dart:async';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _skipOnboarding() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: [
              _buildPage(
                color: Colors.blue,
                imagePath: 'assets/images/scroll1.jpg',
                title: 'Welcome to Playfinity Central',
                description: 'Your one-stop-shop for all things sports!',
              ),
              _buildPage(
                color: Colors.green,
                imagePath: 'assets/images/scroll2.jpg',
                title: 'Discover Local Sports Events',
                description: 'Personalize your experience!',
              ),
              _buildPage(
                color: Colors.teal,
                imagePath: 'assets/images/scroll3.jpg',
                title: 'Enjoy the World of Sports',
                description: 'At your fingertips!',
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: TextButton(
              onPressed: _skipOnboarding,
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => _indicator(index == _currentPageIndex),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: isActive ? Colors.white : Colors.white54,
      ),
    );
  }

  Widget _buildPage({required Color color, required String imagePath, required String title, required String description}) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
