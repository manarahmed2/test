import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/data/repositories/player_repository.dart';
import 'package:sports_app/cubits/player_cubit.dart';
import 'package:share_plus/share_plus.dart';

class PlayersScreen extends StatelessWidget {
  final String teamId;

  const PlayersScreen({required this.teamId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayersCubit(PlayersRepository(Dio()), teamId)..fetchPlayers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Players'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search Player',
                  border: OutlineInputBorder(),
                ),
                onChanged: (query) {
                  context.read<PlayersCubit>().searchPlayers(query);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<PlayersCubit, PlayersState>(
                builder: (context, state) {
                  if (state is PlayersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PlayersLoaded) {
                    return ListView.builder(
                      itemCount: state.players.length,
                      itemBuilder: (context, index) {
                        final player = state.players[index];
                        return ListTile(
                          leading: Image.network(
                            player.imageUrl,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.person, size: 40);
                            },
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) {
                                return child;
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          title: Text(player.name),
                          subtitle: Text(player.type),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(player.name),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      player.imageUrl,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(Icons.person, size: 100);
                                      },
                                      loadingBuilder: (context, child, progress) {
                                        if (progress == null) {
                                          return child;
                                        } else {
                                          return const CircularProgressIndicator();
                                        }
                                      },
                                    ),
                                    Text('Number: ${player.number}'),
                                    Text('Country: ${player.country}'),
                                    Text('Type: ${player.type}'),
                                    Text('Age: ${player.age}'),
                                    Text('Yellow Cards: ${player.yellowCards}'),
                                    Text('Red Cards: ${player.redCards}'),
                                    Text('Goals: ${player.goals}'),
                                    Text('Assists: ${player.assists}'),
                                    SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        // استخدم الحزمة 'share_plus' لمشاركة معلومات اللاعب
                                        Share.share('The player: ${player.name} from ${player.country}!');
                                      },
                                      child:  Text('Share Player',)
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (state is PlayersError) {
                    return Center(child: Text('Failed to load players: ${state.message}'));
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
