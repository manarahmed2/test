import 'package:flutter/material.dart';
import 'teams_screen.dart';
import 'top_scors_screen.dart';

class LeagueDetailsScreen extends StatelessWidget {
  final String leagueId;

  LeagueDetailsScreen({required this.leagueId});

  @override
  Widget build(BuildContext context) {
    // Convert leagueId to int if needed
    final int leagueIdInt = int.tryParse(leagueId) ?? 0; // Provide a default value if parsing fails

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('League Details'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Teams'),
              Tab(text: 'Top Scorers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TeamsScreen(leagueId: leagueIdInt), // Pass int here
            TopScorersScreen(leagueId: leagueId), // Pass int here
          ],
        ),
      ),
    );
  }
}
