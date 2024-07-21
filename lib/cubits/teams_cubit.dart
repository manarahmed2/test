import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/data/repositories/team_repository.dart';
import 'package:sports_app/data/models/team.dart';

abstract class TeamsState {}

class TeamsInitial extends TeamsState {}

class TeamsLoading extends TeamsState {}

class TeamsLoaded extends TeamsState {
  final List<Team> teams;

  TeamsLoaded(this.teams);
}

class TeamsError extends TeamsState {
  final String message;

  TeamsError(this.message);
}

class TeamsCubit extends Cubit<TeamsState> {
  final TeamsRepository teamsRepository;
  final int leagueId;

  TeamsCubit(this.teamsRepository, this.leagueId) : super(TeamsInitial());

  Future<void> fetchTeams() async {
    emit(TeamsLoading());
    try {
      final teams = await teamsRepository.getTeams(leagueId);
      emit(TeamsLoaded(teams));
    } catch (e) {
      emit(TeamsError(e.toString()));
    }
  }

  Future<void> searchTeams(String teamName) async {
    emit(TeamsLoading());
    try {
      final teams = await teamsRepository.searchTeams(leagueId, teamName);
      emit(TeamsLoaded(teams));
    } catch (e) {
      emit(TeamsError(e.toString()));
    }
  }
}
