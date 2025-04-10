import 'package:pokemon_app/core/error/errors.dart';
import 'package:pokemon_app/features/battle/domain/entities/battle_entity.dart';

abstract class BattleRepository {
  Future<Either<Failure, BattleEntity>> startBattle(String selectedPokemonId);
}
