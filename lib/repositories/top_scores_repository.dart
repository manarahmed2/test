import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/top_scores.dart';

class TopScorerRepository {
  final String baseUrl = 'https://apiv2.allsportsapi.com/football/';
  final String apiKey = 'a8428db3358b7761ef707e665f3f3817cd5f9bf77fd7cdf6730bf7010ac9d07b';

  Future<List<TopScorers>> fetchTopScorers() async {
    final response = await http.get(Uri.parse('${baseUrl}?&met=Topscorers&leagueId=4&APIkey=$apiKey'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['result'];
      return body.map((dynamic item) => TopScorers.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load top scorers');
    }
  }
}
