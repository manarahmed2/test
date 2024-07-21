import 'package:flutter/material.dart';
import '../models/top_scores.dart';
import '../repositories/top_scores_repository.dart';

class TopScorerProvider with ChangeNotifier {
  List<TopScorers> _topScorers = [];
  List<TopScorers> get topScorers => _topScorers;

  final TopScorerRepository _topScorerRepository = TopScorerRepository();

  Future<void> fetchTopScorers() async {
    _topScorers = await _topScorerRepository.fetchTopScorers();
    notifyListeners();
  }
}
