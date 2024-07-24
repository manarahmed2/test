import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/data/repositories/player_repository.dart';
import 'package:sports_app/cubits/player_cubit.dart'; // تأكد من تحديث المسار إذا لزم الأمر
import 'package:sports_app/cubits/player_state.dart'; // تأكد من تحديث المسار إذا لزم الأمر
import 'package:sports_app/widgets/player_search_field.dart';
import 'package:sports_app/widgets/players_list.dart';
import 'package:sports_app/widgets/players_app_bar.dart';

class PlayersScreen extends StatelessWidget {
  final String teamId;

  const PlayersScreen({required this.teamId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayersCubit(PlayersRepository(Dio()), teamId)..fetchPlayers(),
      child: Scaffold(
        backgroundColor: const Color(0xff191F1A),
        appBar: const PlayersAppBar(),
        body: Column(
          children: [
            const PlayerSearchField(),
            Expanded(
              child: BlocBuilder<PlayersCubit, PlayersState>(
                builder: (context, state) {
                  if (state is PlayersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PlayersLoaded) {
                    return PlayersList(players: state.players);
                  } else if (state is PlayersError) {
                    return Center(
                        child: Text('Failed to load players: ${state.message}',
                            style: const TextStyle(color: Colors.white)));
                  } else {
                    return const Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
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
