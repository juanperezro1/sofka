
class Score {
  final String player;
  final String score;

  Score({
    required this.player,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'player': player,
      'score': score,
    };
  }

  static Score fromMap(Map<String, dynamic> map, String documentId) {
    const variable = null;
    if (map == null) return variable;

    return Score(
      player: map['player'],
      score: map['score'],
    );
  }
}