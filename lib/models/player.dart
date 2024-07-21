class Player {
  final int id;
  final String name;
  final String number;
  final String country;
  final String image;
  final String type;
  final String age;
  final String yellowCards;
  final String redCards;
  final String goals;
  final String assists;

  Player({
    required this.id,
    required this.name,
    required this.number,
    required this.country,
    required this.image,
    required this.type,
    required this.age,
    required this.yellowCards,
    required this.redCards,
    required this.goals,
    required this.assists,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['player_id'] ?? 0,
      name: json['player_name'] ?? '',
      number: json['player_number'] ?? '',
      country: json['player_country'] ?? '',
      image: json['player_image'] ?? '',
      type: json['player_type'] ?? '',
      age: json['player_age'] ?? '',
      yellowCards: json['yellow_cards'] ?? '',
      redCards: json['red_cards'] ?? '',
      goals: json['goals'] ?? '',
      assists: json['assists'] ?? '',
    );
  }
}
