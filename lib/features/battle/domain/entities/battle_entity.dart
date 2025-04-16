import 'package:pokemon_app/features/battle/domain/entities/entities.dart';

class BattleEntity {
  final BattlePokemonData playerPokemon;
  final BattlePokemonData opponentPokemon;
  final List<Turn> turns;
  final Winner winner;
  final int totalTurns;

  BattleEntity({
    required this.playerPokemon,
    required this.opponentPokemon,
    required this.turns,
    required this.winner,
    required this.totalTurns,
  });
}

class Winner {
  final String id;
  final String name;
  final String imageUrl;

  Winner({required this.id, required this.name, required this.imageUrl});
}
