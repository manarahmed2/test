import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/top_scorer_repository.dart';
import '../data/models/top_scorer.dart';

abstract class TopScorersState {}
class TopScorersInitial extends TopScorersState {}
class TopScorersLoading extends TopScorersState {}
class TopScorersLoaded extends TopScorersState {
  final List<Scorer> topScorers;
  TopScorersLoaded(this.topScorers);
}
class TopScorersError extends TopScorersState {
  final String message;
  TopScorersError(this.message);
}

class TopScorersCubit extends Cubit<TopScorersState> {
  final TopScorersRepository topScorersRepository;

  TopScorersCubit(this.topScorersRepository) : super(TopScorersInitial());

  Future<void> fetchTopScorers(String leagueId) async {
    emit(TopScorersLoading());
    try {
      final topScorers = await topScorersRepository.getTopScorers(int.parse(leagueId));
      emit(TopScorersLoaded(topScorers));
    } catch (e) {
      emit(TopScorersError(e.toString()));
    }
  }
}
