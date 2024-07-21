import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/cubits/teams_cubit.dart';
import 'package:sports_app/data/repositories/team_repository.dart';
import 'package:sports_app/data/repositories/top_scorer_repository.dart';
import 'screens/top_scors_screen.dart';
import 'screens/player_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/league_screen.dart';
import 'data/repositories/player_repository.dart'; // تأكد من استيراد PlayerRepository
import 'cubits/top_scorer_cubit.dart';
import 'cubits/player_cubit.dart';
import 'cubits/teams_cubit.dart'; // أضف Cubit الخاص بالفرق

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TeamsCubit(TeamsRepository(Dio()), 4)), // قم بإعداد Cubit للفرق
        BlocProvider(create: (context) => TopScorersCubit(TopScorersRepository(Dio()))),
        BlocProvider(create: (context) => PlayersCubit(PlayersRepository(Dio()),'78' )),
      ],
      child: MaterialApp(
        title: 'Sports App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => PlayersScreen(teamId: '78',), // تحديث إلى SplashScreen
          //'/onboarding': (context) => OnboardingScreen(),
          //'/login': (context) => LoginScreen(),
          //'/home': (context) => HomeScreen(),
         // '/league': (context) => LeagueDetailsScreen(leagueId: '1'), // استبدل '1' بمعرف الدوري الصحيح
          // يمكنك تخصيص القيم الأخرى هنا إذا لزم الأمر
        },
      ),
    );
  }
}
