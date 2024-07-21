import 'package:flutter/material.dart';
import '../models/player.dart';
import '../repositories/player_repository.dart';

class PlayerProvider with ChangeNotifier {
  final PlayerRepository playerRepository;

  PlayerProvider({required this.playerRepository});

  List<Player> _players = [];
  Player? _selectedPlayer;

  List<Player> get players => _players;
  Player? get selectedPlayer => _selectedPlayer;

  Future<void> fetchPlayers(int teamId) async {
    try {
      _players = await playerRepository.fetchPlayers(teamId);
      notifyListeners();
    } catch (error) {
      print('Error fetching players: $error');
    }
  }

  Future<void> fetchPlayerDetails(int playerId) async {
    try {
      _selectedPlayer = await playerRepository.fetchPlayerDetails(playerId);
      notifyListeners();
    } catch (error) {
      print('Error fetching player details: $error');
    }
  }
}
