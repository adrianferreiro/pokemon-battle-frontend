import 'package:equatable/equatable.dart';
import 'package:pokemon_app/features/battle/domain/entities/entities.dart';

class TurnModel extends Equatable {
  final int turn;
  final String attacker;
  final String defender;
  final int damage;
  final int defenderRemainingHp;

  const TurnModel({
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

  TurnEntity toEntity() {
    return TurnEntity(
      turn: turn,
      attacker: attacker,
      defender: defender,
      damage: damage,
      defenderRemainingHp: defenderRemainingHp,
    );
  }

  @override
  List<Object?> get props => [
    turn,
    attacker,
    defender,
    damage,
    defenderRemainingHp,
  ];
}
