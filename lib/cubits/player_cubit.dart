import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/data/repositories/player_repository.dart';
import 'package:sports_app/data/models/player.dart';

abstract class PlayersState {}

class PlayersInitial extends PlayersState {}

class PlayersLoading extends PlayersState {}

class PlayersLoaded extends PlayersState {
  final List<Player> players;
  PlayersLoaded(this.players);
}

class PlayersError extends PlayersState {
  final String message;
  PlayersError(this.message);
}
class PlayersCubit extends Cubit<PlayersState> {
  final PlayersRepository playersRepository;
  final String teamId;

  PlayersCubit(this.playersRepository, this.teamId) : super(PlayersInitial());

  Future<void> fetchPlayers() async {
    emit(PlayersLoading());
    try {
      final players = await playersRepository.getPlayers(int.parse(teamId));
      emit(PlayersLoaded(players));
    } catch (e) {
      emit(PlayersError(e.toString()));
    }
  }

  Future<void> searchPlayers(String playerName) async {
    emit(PlayersLoading());
    try {
      final players = await playersRepository.searchPlayers(int.parse(teamId), playerName);
      emit(PlayersLoaded(players));
    } catch (e) {
      emit(PlayersError(e.toString()));
    }
  }
}
