class BattlePokemonData {
  final String id;
  final String name;
  final int attack;
  final int defense;
  final int hpInitial;
  final int hpFinal;
  final int speed;
  final String type;
  final String imageUrl;
  final int totalDamageDealt;

  BattlePokemonData({
    required this.id,
    required this.name,
    required this.attack,
    required this.defense,
    required this.hpInitial,
    required this.hpFinal,
    required this.speed,
    required this.type,
    required this.imageUrl,
    required this.totalDamageDealt,
  });
}
