import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/top_scores_provider.dart';

class TopScorersScreen extends StatefulWidget {
  @override
  _TopScorersScreenState createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch top scorers when the screen is initialized
    Provider.of<TopScorerProvider>(context, listen: false).fetchTopScorers();
  }

  @override
  Widget build(BuildContext context) {
    final topScorerProvider = Provider.of<TopScorerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Scorers'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: topScorerProvider.topScorers.length,
        itemBuilder: (context, index) {
          final topScorer = topScorerProvider.topScorers[index];
          return Card(
            elevation: 3.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(
                topScorer.playerName.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Goals: ${topScorer.playerGoals.toString()}'), // Convert int to String
            ),
          );
        },
      ),
    );
  }
}
