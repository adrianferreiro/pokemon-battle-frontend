import 'package:pokemon_app/features/battle/domain/entities/battle_entity.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';

class BattleMappers {
  static PokemonEntity battlePokemonToPokemonEntity(
    BattlePokemonData battlePokemon,
  ) {
    return PokemonEntity(
      id: battlePokemon.id,
      name: battlePokemon.name,
      imageUrl: battlePokemon.imageUrl,
      hp: battlePokemon.hpInitial,
      attack: battlePokemon.attack,
      defense: battlePokemon.defense,
      speed: battlePokemon.speed,
      type: battlePokemon.type,
    );
  }
}
