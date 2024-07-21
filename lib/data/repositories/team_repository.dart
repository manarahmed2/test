import 'package:dio/dio.dart';
import '../models/team.dart';

class TeamsRepository {
  final Dio dio;
  final String apiKey = 'f06896886f1b1c3e4f649c2a759041a0016c2e1fc6de384e8213c84b4c4f8de8';

  TeamsRepository(this.dio);

  Future<List<Team>> getTeams(int leagueId) async {
    final url = 'https://apiv2.allsportsapi.com/football/?met=Teams&APIkey=$apiKey&leagueId=$leagueId';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data['result'] as List;
        return data.map((json) => Team.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load teams');
      }
    } catch (e) {
      print('Error fetching teams: $e');
      throw e;
    }
  }

  Future<List<Team>> searchTeams(int leagueId, String teamName) async {
    final url = 'https://apiv2.allsportsapi.com/football/?met=Teams&APIkey=$apiKey&leagueId=$leagueId&teamName=$teamName';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data['result'] as List;
        return data.map((json) => Team.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search teams');
      }
    } catch (e) {
      print('Error searching teams: $e');
      throw e;
    }
  }
}
