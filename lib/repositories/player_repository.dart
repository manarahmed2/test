import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/player.dart';

class PlayerRepository {
  final String apiKey = 'a8428db3358b7761ef707e665f3f3817cd5f9bf77fd7cdf6730bf7010ac9d07b';
  final String baseUrl = 'https://apiv2.allsportsapi.com/football/';

  Future<List<Player>> fetchPlayers(int teamId) async {
    final url = '${baseUrl}?met=Players&teamId=$teamId&APIkey=$apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['result'];
        return (data as List).map((player) => Player.fromJson(player)).toList();
      } else {
        throw Exception('Failed to load players: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching players: $error');
      rethrow;
    }
  }

  Future<Player?> fetchPlayerDetails(int player_id) async {
    final url = '${baseUrl}?met=Players&playerId=$player_id&APIkey=$apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['result'];
        if (data.isNotEmpty) {
          return Player.fromJson(data[0]);
        } else {
          throw Exception('No player data available');
        }
      } else {
        throw Exception('Failed to load player details: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching player details: $error');
      rethrow;
    }
  }
}
