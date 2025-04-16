class PokemonEntity {
  final String id;
  final String name;
  final int attack;
  final int defense;
  final int hp;
  final int speed;
  final String type;
  final String imageUrl;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.attack,
    required this.defense,
    required this.hp,
    required this.speed,
    required this.type,
    required this.imageUrl,
  });
}
