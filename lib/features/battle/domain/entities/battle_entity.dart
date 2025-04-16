import 'package:pokemon_app/features/battle/domain/entities/entities.dart';

class BattleEntity {
  final BattlePokemonDataEntity playerPokemon;
  final BattlePokemonDataEntity opponentPokemon;
  final List<TurnEntity> turns;
  final WinnerEntity winner;
  final int totalTurns;

  BattleEntity({
    required this.playerPokemon,
    required this.opponentPokemon,
    required this.turns,
    required this.winner,
    required this.totalTurns,
  });
}
