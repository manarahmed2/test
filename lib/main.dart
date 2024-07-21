import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/screens/top_scors_screen.dart';
import 'screens/player_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/league_screen.dart';
import 'screens/top_scors_screen.dart';
import 'providers/team_provider.dart';
import 'providers/top_scores_provider.dart';
import 'providers/player_provider.dart';
import 'repositories/player_repository.dart'; // تأكد من استيراد PlayerRepository

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TeamProvider()),
        ChangeNotifierProvider(create: (_) => TopScorerProvider()),
        ChangeNotifierProvider(create: (_) => PlayerProvider(playerRepository: PlayerRepository())),
      ],
      child: MaterialApp(
        title: 'Sports App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => PlayersScreen(teamId: 78),
          // '/onboarding': (context) => OnboardingScreen(),
          // '/login': (context) => LoginScreen(),
          // '/home': (context) => HomeScreen(),
          // '/league': (context) => LeagueScreen(),
          // '/top_scorers': (context) => TopScorersScreen(),
          // '/players': (context) => PlayerScreen(teamId: 0),
        },
      ),
    );
  }
}
