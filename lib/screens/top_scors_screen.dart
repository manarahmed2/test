import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/cubits/top_scorer_cubit.dart';
import 'package:sports_app/data/repositories/top_scorer_repository.dart';
import '../cubits/top_scorer_cubit.dart';
import '../data/models/top_scorer.dart';

class TopScorersScreen extends StatelessWidget {
  final String leagueId;

  const TopScorersScreen({Key? key, required this.leagueId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopScorersCubit(RepositoryProvider.of<TopScorersRepository>(context))
        ..fetchTopScorers(leagueId),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top Scorers'),
        ),
        body: BlocBuilder<TopScorersCubit, TopScorersState>(
          builder: (context, state) {
            if (state is TopScorersLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TopScorersLoaded) {
              return ListView.builder(
                itemCount: state.topScorers.length,
                itemBuilder: (context, index) {
                  final scorer = state.topScorers[index];
                  return ListTile(
                    leading: FadeInImage.assetNetwork(
                      placeholder: 'assets/placeholder_image.png',
                      image: scorer.playerImage ?? 'assets/placeholder_image.png',
                      fit: BoxFit.cover,
                    ),
                    title: Text(scorer.playerName),
                    subtitle: Text('Goals: ${scorer.playerGoals}'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(scorer.playerName),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                if (scorer.playerImage != null)
                                  Image.network(scorer.playerImage!),
                                Text('Number: ${scorer.playerNumber}'),
                                Text('Country: ${scorer.playerCountry ?? 'N/A'}'),
                                Text('Type: ${scorer.playerType}'),
                                Text('Age: ${scorer.playerAge}'),
                                Text('Yellow Cards: ${scorer.playerYellowCards}'),
                                Text('Red Cards: ${scorer.playerRedCards}'),
                                Text('Goals: ${scorer.playerGoals}'),
                                Text('Assists: ${scorer.playerAssists}'),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              );
            } else if (state is TopScorersError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('Please wait...'));
            }
          },
        ),
      ),
    );
  }
}
