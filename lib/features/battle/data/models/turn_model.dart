import 'package:pokemon_app/features/battle/domain/entities/battle_entity.dart';

class TurnModel {
  final int turn;
  final String attacker;
  final String defender;
  final int damage;
  final int defenderRemainingHp;

  TurnModel({
    required this.turn,
    required this.attacker,
    required this.defender,
    required this.damage,
    required this.defenderRemainingHp,
  });

  factory TurnModel.fromJson(Map<String, dynamic> json) {
    return TurnModel(
      turn: json['turn'] as int,
      attacker: json['attacker'] as String,
      defender: json['defender'] as String,
      damage: json['damage'] as int,
      defenderRemainingHp: json['defenderRemainingHp'] as int,
    );
  }

  Turn toEntity() {
    return Turn(
      turn: turn,
      attacker: attacker,
      defender: defender,
      damage: damage,
      defenderRemainingHp: defenderRemainingHp,
    );
  }
}
