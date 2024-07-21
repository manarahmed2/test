import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/league_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';
  static const String league = '/league';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => SplashScreen(),
      onboarding: (context) => OnboardingScreen(),
      login: (context) => LoginScreen(),
      home: (context) => HomeScreen(),
      league: (context) => LeagueScreen(),
    };
  }
}
