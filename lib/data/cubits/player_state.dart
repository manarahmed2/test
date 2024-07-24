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
