class Turn {
  final int turn;
  final String attacker;
  final String defender;
  final int damage;
  final int defenderRemainingHp;

  Turn({
    required this.turn,
    required this.attacker,
    required this.defender,
    required this.damage,
    required this.defenderRemainingHp,
  });
}
