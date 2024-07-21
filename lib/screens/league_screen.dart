import 'package:flutter/material.dart';
import 'package:sports_app/screens/top_scors_screen.dart';
import 'teams_screen.dart';
import 'top_scors_screen.dart';

class LeagueScreen extends StatefulWidget {
  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Teams'),
              Tab(text: 'Top Scorers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TeamsScreen(),
            TopScorersScreen(),
          ],
        ),
      ),
    );
  }
}
