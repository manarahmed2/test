import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/data/cubits/OnboardingCubit.dart';
import 'screens/player_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'data/repositories/player_repository.dart'; // تأكد من استيراد PlayerRepository
import 'package:sports_app/data/cubits/player_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PlayersCubit(PlayersRepository(Dio()),'78' )),
        BlocProvider(create: (context) => OnboardingCubit()), // إضافة OnboardingCubit
      ],
      child: MaterialApp(
        title: 'Sports App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => PlayersScreen(teamId: '141'), // تحديث إلى SplashScreen
         //'/onboarding': (context) => OnboardingScreen(),
         // '/login': (context) => LoginScreen(),
         // '/home': (context) => HomeScreen(),
          // '/league': (context) => LeagueDetailsScreen(leagueId: '1'), 
          // استبدل '1' بمعرف الدوري الصحيح
          // يمكنك تخصيص القيم الأخرى هنا إذا لزم الأمر
        },
      ),
    );
  }
}
