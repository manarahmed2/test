import 'package:dio/dio.dart';
import '../models/top_scorer.dart';

class TopScorersRepository {
  final Dio _dio;

  TopScorersRepository(this._dio);

  Future<List<Scorer>> getTopScorers(int leagueId) async {
    try {
      final response = await _dio.get('https://api.example.com/topscorers/$leagueId');
      final topScorers = TopScorers.fromJson(response.data);
      return topScorers.scorers;
    } catch (e) {
      throw Exception('Failed to load top scorers');
    }
  }
}
