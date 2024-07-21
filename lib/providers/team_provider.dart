import 'package:flutter/material.dart';
import '../models/team.dart';
import '../repositories/team_repository.dart';
class TeamProvider with ChangeNotifier {
  List<Team> _teams = [];
  List<Team> get teams => _teams;

  final TeamRepository _teamRepository = TeamRepository();
  final int defaultLeagueId = 123; // استبدل 123 بالمعرف الافتراضي للدوري

  Future<void> fetchLeagueTeams(int leagueId) async {
    try {
      _teams = await _teamRepository.getTeams(leagueId);
      notifyListeners();
    } catch (error) {
      print('Failed to load teams: $error');
    }
  }

  Future<void> searchTeam(String teamName) async {
    try {
      if (teamName.isEmpty) {
        await fetchLeagueTeams(defaultLeagueId);
      } else {
        _teams = await _teamRepository.searchTeam(teamName);
        notifyListeners();
      }
    } catch (error) {
      print('Failed to search teams: $error');
    }
  }
}
