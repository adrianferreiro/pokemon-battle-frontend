import 'package:pokemon_app/features/pokemon/domain/entities/entities.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.id,
    required super.name,
    required super.attack,
    required super.defense,
    required super.hp,
    required super.speed,
    required super.type,
    required super.imageUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
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
