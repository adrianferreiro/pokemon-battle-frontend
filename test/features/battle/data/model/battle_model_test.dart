import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/features/battle/data/models/models.dart';
import 'package:pokemon_app/features/battle/domain/entities/battle_entity.dart';

void main() {
  group('BattleModel', () {
    final battleJson = {
      "playerPokemon": {
        "id": "pokemon-1",
        "name": "Pikachu",
        "attack": 4,
        "defense": 3,
        "hpInitial": 3,
        "hpFinal": 1,
        "speed": 6,
        "type": "Electric",
        "imageUrl":
            "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png",
        "totalDamageDealt": 3,
      },
      "opponentPokemon": {
        "id": "pokemon-2",
        "name": "Charmander",
        "attack": 4,
        "defense": 3,
        "hpInitial": 3,
        "hpFinal": 0,
        "speed": 4,
        "type": "Fire",
        "imageUrl":
            "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/004.png",
        "totalDamageDealt": 2,
      },
      "turns": [
        {
          "turn": 1,
          "attacker": "Pikachu",
          "defender": "Charmander",
          "damage": 1,
          "defenderRemainingHp": 2,
        },
        {
          "turn": 2,
          "attacker": "Charmander",
          "defender": "Pikachu",
          "damage": 1,
          "defenderRemainingHp": 2,
        },
        {
          "turn": 3,
          "attacker": "Pikachu",
          "defender": "Charmander",
          "damage": 1,
          "defenderRemainingHp": 1,
        },
        {
          "turn": 4,
          "attacker": "Charmander",
          "defender": "Pikachu",
          "damage": 1,
          "defenderRemainingHp": 1,
        },
        {
          "turn": 5,
          "attacker": "Pikachu",
          "defender": "Charmander",
          "damage": 1,
          "defenderRemainingHp": 0,
        },
      ],
      "winner": {
        "id": "pokemon-1",
        "name": "Pikachu",
        "imageUrl":
            "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png",
      },
      "totalTurns": 5,
    };
    BattlePokemonDataModel playerPokemon = BattlePokemonDataModel(
      id: 'pokemon-1',
      name: 'Pikachu',
      attack: 4,
      defense: 3,
      hpInitial: 3,
      hpFinal: 1,
      speed: 6,
      type: 'Electric',
      imageUrl:
          'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png',
      totalDamageDealt: 3,
    );

    BattlePokemonDataModel opponentPokemon = BattlePokemonDataModel(
      id: 'pokemon-2',
      name: 'Charmander',
      attack: 4,
      defense: 3,
      hpInitial: 3,
      hpFinal: 0,
      speed: 4,
      type: 'Fire',
      imageUrl:
          'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/004.png',
      totalDamageDealt: 2,
    );

    TurnModel turn001 = TurnModel(
      turn: 1,
      attacker: "attacker",
      defender: "defender",
      damage: 1,
      defenderRemainingHp: 2,
    );
    TurnModel turn002 = TurnModel(
      turn: 2,
      attacker: "Charmander",
      defender: "Pikachu",
      damage: 1,
      defenderRemainingHp: 2,
    );
    TurnModel turn003 = TurnModel(
      turn: 3,
      defender: "Charmander",
      attacker: "Pikachu",
      damage: 1,
      defenderRemainingHp: 1,
    );
    TurnModel turn004 = TurnModel(
      turn: 4,
      attacker: "Charmander",
      defender: "Pikachu",
      damage: 1,
      defenderRemainingHp: 1,
    );
    TurnModel turn005 = TurnModel(
      turn: 5,
      attacker: "Pikachu",
      defender: "Charmander",
      damage: 1,
      defenderRemainingHp: 0,
    );

    List<TurnModel> turns = [turn001, turn002, turn003, turn004, turn005];

    WinnerModel winner = WinnerModel(
      id: 'pokemon-1',
      name: 'Pikachu',
      imageUrl:
          'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png',
    );

    BattleModel battleModel = BattleModel(
      playerPokemon: playerPokemon,
      opponentPokemon: opponentPokemon,
      turns: turns,
      winner: winner,
      totalTurns: 5,
    );

    test('fromJson should return valid BattleModel', () {
      final result = BattleModel.fromJson(battleJson);
      expect(result, isA<BattleModel>());
      expect(result.playerPokemon, isA<BattlePokemonDataModel>());
      expect(result.opponentPokemon, isA<BattlePokemonDataModel>());
      expect(result.turns, isA<List<TurnModel>>());
      expect(result.winner, isA<WinnerModel>());
      expect(result.totalTurns, equals(5));
      expect(result.playerPokemon.name, equals('Pikachu'));
      expect(result.opponentPokemon.name, equals('Charmander'));
    });

    test('toEntity should return valid BattleEntity', () {
      final result = battleModel.toEntity();
      expect(result, isA<BattleEntity>());
    });
  });
}
