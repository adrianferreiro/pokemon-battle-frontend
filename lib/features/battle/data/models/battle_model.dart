import 'package:pokemon_app/features/battle/data/models/models.dart';
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
