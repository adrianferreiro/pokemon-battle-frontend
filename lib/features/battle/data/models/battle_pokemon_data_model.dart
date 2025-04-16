import 'package:equatable/equatable.dart';
import 'package:pokemon_app/features/battle/domain/entities/entities.dart';

class BattlePokemonDataModel extends Equatable {
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

  const BattlePokemonDataModel({
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

  factory BattlePokemonDataModel.fromJson(Map<String, dynamic> json) {
    return BattlePokemonDataModel(
      id: json['id'] as String,
      name: json['name'] as String,
      attack: json['attack'] as int,
      defense: json['defense'] as int,
      hpInitial: json['hpInitial'] as int,
      hpFinal: json['hpFinal'] as int,
      speed: json['speed'] as int,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String,
      totalDamageDealt: json['totalDamageDealt'] as int,
    );
  }

  BattlePokemonDataEntity toEntity() {
    return BattlePokemonDataEntity(
      id: id,
      name: name,
      attack: attack,
      defense: defense,
      hpInitial: hpInitial,
      hpFinal: hpFinal,
      speed: speed,
      type: type,
      imageUrl: imageUrl,
      totalDamageDealt: totalDamageDealt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    attack,
    defense,
    hpInitial,
    hpFinal,
    speed,
    type,
    imageUrl,
    totalDamageDealt,
  ];
}
