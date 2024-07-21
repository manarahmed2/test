import 'package:dio/dio.dart';

class TopScorers {
  final List<Scorer> scorers;

  TopScorers({required this.scorers});

  factory TopScorers.fromJson(Map<String, dynamic> json) {
    var list = json['result'] as List? ?? [];
    List<Scorer> scorersList = list.map((i) => Scorer.fromJson(i)).toList();

    return TopScorers(scorers: scorersList);
  }

  Map<String, dynamic> toJson() {
    return {
      'scorers': scorers.map((e) => e.toJson()).toList(),
    };
  }
}

class Scorer {
  final int playerKey;
  final String? playerImage;
  final String playerName;
  final String playerNumber;
  final String? playerCountry;
  final String playerType;
  final String playerAge;
  final String playerMatchPlayed;
  final String playerGoals;
  final String playerYellowCards;
  final String playerRedCards;
  final String playerInjured;
  final String playerSubstituteOut;
  final String playerSubstitutesOnBench;
  final String playerAssists;
  final String? playerBirthdate;
  final String playerIsCaptain;
  final String playerShotsTotal;
  final String playerGoalsConceded;
  final String playerFoulsCommitted;
  final String playerTackles;
  final String playerBlocks;
  final String playerCrossesTotal;
  final String playerInterceptions;
  final String playerClearances;
  final String playerDispossesed;
  final String playerSaves;
  final String playerInsideBoxSaves;
  final String playerDuelsTotal;
  final String playerDuelsWon;
  final String playerDribbleAttempts;
  final String playerDribbleSucc;
  final String playerPenComm;
  final String playerPenWon;
  final String playerPenScored;
  final String playerPenMissed;
  final String playerPasses;
  final String playerPassesAccuracy;
  final String playerKeyPasses;
  final String playerWoordworks;
  final String playerRating;

  Scorer({
    required this.playerKey,
    this.playerImage,
    required this.playerName,
    required this.playerNumber,
    this.playerCountry,
    required this.playerType,
    required this.playerAge,
    required this.playerMatchPlayed,
    required this.playerGoals,
    required this.playerYellowCards,
    required this.playerRedCards,
    required this.playerInjured,
    required this.playerSubstituteOut,
    required this.playerSubstitutesOnBench,
    required this.playerAssists,
    this.playerBirthdate,
    required this.playerIsCaptain,
    required this.playerShotsTotal,
    required this.playerGoalsConceded,
    required this.playerFoulsCommitted,
    required this.playerTackles,
    required this.playerBlocks,
    required this.playerCrossesTotal,
    required this.playerInterceptions,
    required this.playerClearances,
    required this.playerDispossesed,
    required this.playerSaves,
    required this.playerInsideBoxSaves,
    required this.playerDuelsTotal,
    required this.playerDuelsWon,
    required this.playerDribbleAttempts,
    required this.playerDribbleSucc,
    required this.playerPenComm,
    required this.playerPenWon,
    required this.playerPenScored,
    required this.playerPenMissed,
    required this.playerPasses,
    required this.playerPassesAccuracy,
    required this.playerKeyPasses,
    required this.playerWoordworks,
    required this.playerRating,
  });

  factory Scorer.fromJson(Map<String, dynamic> json) {
    return Scorer(
      playerKey: json['player_key'] ?? 0,
      playerImage: json['player_image'] as String?,
      playerName: json['player_name'] ?? '',
      playerNumber: json['player_number'] ?? '',
      playerCountry: json['player_country'] as String?,
      playerType: json['player_type'] ?? '',
      playerAge: json['player_age'] ?? '',
      playerMatchPlayed: json['player_match_played'] ?? '',
      playerGoals: json['player_goals'] ?? '',
      playerYellowCards: json['player_yellow_cards'] ?? '',
      playerRedCards: json['player_red_cards'] ?? '',
      playerInjured: json['player_injured'] ?? '',
      playerSubstituteOut: json['player_substitute_out'] ?? '',
      playerSubstitutesOnBench: json['player_substitutes_on_bench'] ?? '',
      playerAssists: json['player_assists'] ?? '',
      playerBirthdate: json['player_birthdate'] as String?,
      playerIsCaptain: json['player_is_captain'] ?? '',
      playerShotsTotal: json['player_shots_total'] ?? '',
      playerGoalsConceded: json['player_goals_conceded'] ?? '',
      playerFoulsCommitted: json['player_fouls_committed'] ?? '',
      playerTackles: json['player_tackles'] ?? '',
      playerBlocks: json['player_blocks'] ?? '',
      playerCrossesTotal: json['player_crosses_total'] ?? '',
      playerInterceptions: json['player_interceptions'] ?? '',
      playerClearances: json['player_clearances'] ?? '',
      playerDispossesed: json['player_dispossesed'] ?? '',
      playerSaves: json['player_saves'] ?? '',
      playerInsideBoxSaves: json['player_inside_box_saves'] ?? '',
      playerDuelsTotal: json['player_duels_total'] ?? '',
      playerDuelsWon: json['player_duels_won'] ?? '',
      playerDribbleAttempts: json['player_dribble_attempts'] ?? '',
      playerDribbleSucc: json['player_dribble_succ'] ?? '',
      playerPenComm: json['player_pen_comm'] ?? '',
      playerPenWon: json['player_pen_won'] ?? '',
      playerPenScored: json['player_pen_scored'] ?? '',
      playerPenMissed: json['player_pen_missed'] ?? '',
      playerPasses: json['player_passes'] ?? '',
      playerPassesAccuracy: json['player_passes_accuracy'] ?? '',
      playerKeyPasses: json['player_key_passes'] ?? '',
      playerWoordworks: json['player_woordworks'] ?? '',
      playerRating: json['player_rating'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'player_key': playerKey,
      'player_image': playerImage,
      'player_name': playerName,
      'player_number': playerNumber,
      'player_country': playerCountry,
      'player_type': playerType,
      'player_age': playerAge,
      'player_match_played': playerMatchPlayed,
      'player_goals': playerGoals,
      'player_yellow_cards': playerYellowCards,
      'player_red_cards': playerRedCards,
      'player_injured': playerInjured,
      'player_substitute_out': playerSubstituteOut,
      'player_substitutes_on_bench': playerSubstitutesOnBench,
      'player_assists': playerAssists,
      'player_birthdate': playerBirthdate,
      'player_is_captain': playerIsCaptain,
      'player_shots_total': playerShotsTotal,
      'player_goals_conceded': playerGoalsConceded,
      'player_fouls_committed': playerFoulsCommitted,
      'player_tackles': playerTackles,
      'player_blocks': playerBlocks,
      'player_crosses_total': playerCrossesTotal,
      'player_interceptions': playerInterceptions,
      'player_clearances': playerClearances,
      'player_dispossesed': playerDispossesed,
      'player_saves': playerSaves,
      'player_inside_box_saves': playerInsideBoxSaves,
      'player_duels_total': playerDuelsTotal,
      'player_duels_won': playerDuelsWon,
      'player_dribble_attempts': playerDribbleAttempts,
      'player_dribble_succ': playerDribbleSucc,
      'player_pen_comm': playerPenComm,
      'player_pen_won': playerPenWon,
      'player_pen_scored': playerPenScored,
      'player_pen_missed': playerPenMissed,
      'player_passes': playerPasses,
      'player_passes_accuracy': playerPassesAccuracy,
      'player_key_passes': playerKeyPasses,
      'player_woordworks': playerWoordworks,
      'player_rating': playerRating,
    };
  }
}
