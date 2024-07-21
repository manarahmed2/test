import 'package:dio/dio.dart';
import '../models/team.dart';

class TeamRepository {
  final Dio dio = Dio();

  Future<List<Team>> getTeams(int leagueId) async {
    final apiKey = 'a8428db3358b7761ef707e665f3f3817cd5f9bf77fd7cdf6730bf7010ac9d07b';
    final url = 'https://apiv2.allsportsapi.com/football/?met=Teams&APIkey=$apiKey&leagueId=$leagueId';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        // Ensure correct JSON parsing
        return (response.data['result'] as List)
            .map((teamJson) => Team.fromJson(teamJson))
            .toList();
      } else {
        throw Exception('Failed to load teams');
      }
    } catch (e) {
      print('Error fetching teams: $e');
      throw e;
    }
  }

  // Implement searchTeam if needed
  Future<List<Team>> searchTeam(String teamName) async {
  final apiKey = 'a8428db3358b7761ef707e665f3f3817cd5f9bf77fd7cdf6730bf7010ac9d07b';
  final url = 'https://apiv2.allsportsapi.com/football/?met=Teams&APIkey=$apiKey&teamName=$teamName';

  try {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return (response.data['result'] as List)
          .map((teamJson) => Team.fromJson(teamJson))
          .toList();
    } else {
      throw Exception('Failed to search teams');
    }
  } catch (e) {
    print('Error searching teams: $e');
    throw e;
  }
}
}
