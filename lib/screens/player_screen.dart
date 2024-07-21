import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/repositories/player_repository.dart';
import '../providers/player_provider.dart';
import '../models/player.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlayersScreen extends StatelessWidget {
  final int teamId;

  PlayersScreen({required this.teamId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayerProvider(playerRepository: PlayerRepository())..fetchPlayers(teamId),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Players'),
        ),
        body: Consumer<PlayerProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search Player',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Add search logic
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.players.length,
                    itemBuilder: (context, index) {
                      final player = provider.players[index];
                      return ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: player.image,
                          width: 50,
                          height: 50,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.person),
                        ),
                        title: Text(player.name),
                        subtitle: Text(player.type),
                        onTap: () {
                          provider.fetchPlayerDetails(player.id);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(provider.selectedPlayer?.name ?? ''),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: provider.selectedPlayer?.image ?? '',
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(Icons.person),
                                    ),
                                    Text('Number: ${provider.selectedPlayer?.number ?? ''}'),
                                    Text('Country: ${provider.selectedPlayer?.country ?? ''}'),
                                    Text('Type: ${provider.selectedPlayer?.type ?? ''}'),
                                    Text('Age: ${provider.selectedPlayer?.age ?? ''}'),
                                    Text('Yellow Cards: ${provider.selectedPlayer?.yellowCards ?? ''}'),
                                    Text('Red Cards: ${provider.selectedPlayer?.redCards ?? ''}'),
                                    Text('Goals: ${provider.selectedPlayer?.goals ?? ''}'),
                                    Text('Assists: ${provider.selectedPlayer?.assists ?? ''}'),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
