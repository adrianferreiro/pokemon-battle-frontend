import 'package:pokemon_app/features/battle/domain/entities/battle_entity.dart';

class BattleModel {
  final BattlePokemonDataModel playerPokemon;
  final BattlePokemonDataModel opponentPokemon;
  final List<TurnModel> turns;
  final WinnerModel winner;
  final int totalTurns;

  BattleModel({
    required this.playerPokemon,
    required this.opponentPokemon,
    required this.turns,
    required this.winner,
    required this.totalTurns,
  });

  factory BattleModel.fromJson(Map<String, dynamic> json) {
    return BattleModel(
      playerPokemon: BattlePokemonDataModel.fromJson(
        json['playerPokemon'] as Map<String, dynamic>,
      ),
      opponentPokemon: BattlePokemonDataModel.fromJson(
        json['opponentPokemon'] as Map<String, dynamic>,
      ),
      turns:
          (json['turns'] as List<dynamic>)
              .map(
                (turnJson) =>
                    TurnModel.fromJson(turnJson as Map<String, dynamic>),
              )
              .toList(),
      winner: WinnerModel.fromJson(json['winner'] as Map<String, dynamic>),
      totalTurns: json['totalTurns'] as int,
    );
  }

  BattleEntity toEntity() {
    return BattleEntity(
      playerPokemon: playerPokemon.toEntity(),
      opponentPokemon: opponentPokemon.toEntity(),
      turns: turns.map((turnModel) => turnModel.toEntity()).toList(),
      winner: winner.toEntity(),
      totalTurns: totalTurns,
    );
  }
}

class BattlePokemonDataModel {
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

  BattlePokemonDataModel({
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

  BattlePokemonData toEntity() {
    return BattlePokemonData(
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
}

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

class WinnerModel {
  final String id;
  final String name;
  final String imageUrl;

  WinnerModel({required this.id, required this.name, required this.imageUrl});

  factory WinnerModel.fromJson(Map<String, dynamic> json) {
    return WinnerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Winner toEntity() {
    return Winner(id: id, name: name, imageUrl: imageUrl);
  }
}
