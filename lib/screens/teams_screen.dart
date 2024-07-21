import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/cubits/teams_cubit.dart';
import 'package:sports_app/data/repositories/team_repository.dart';

class TeamsScreen extends StatelessWidget {
  final int leagueId;

  TeamsScreen({required this.leagueId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeamsCubit(TeamsRepository(Dio()), leagueId)..fetchTeams(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Teams'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search Team',
                  border: OutlineInputBorder(),
                ),
                onChanged: (query) {
                  context.read<TeamsCubit>().searchTeams(query);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<TeamsCubit, TeamsState>(
                builder: (context, state) {
                  if (state is TeamsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TeamsLoaded) {
                    if (state.teams.isEmpty) {
                      return const Center(child: Text('No teams found'));
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: state.teams.length,
                      itemBuilder: (context, index) {
                        final team = state.teams[index];
                        return Card(
                          child: Column(
                            children: [
                              Image.network(team.teamLogo ?? ''),
                              Text(team.teamName ?? 'Unknown'),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is TeamsError) {
                    return Center(child: Text('Failed to load teams: ${state.message}'));
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
