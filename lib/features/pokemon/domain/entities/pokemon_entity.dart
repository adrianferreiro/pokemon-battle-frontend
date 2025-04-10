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

  factory PokemonEntity.fromJson(Map<String, dynamic> json) {
    return PokemonEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      attack: json['attack'] as int,
      defense: json['defense'] as int,
      hp: json['hp'] as int,
      speed: json['speed'] as int,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'attack': attack,
      'defense': defense,
      'hp': hp,
      'speed': speed,
      'type': type,
      'imageUrl': imageUrl,
    };
  }
}
