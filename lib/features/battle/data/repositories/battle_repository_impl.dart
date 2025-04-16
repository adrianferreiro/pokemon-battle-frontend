import 'package:pokemon_app/core/error/either.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/battle/domain/datasources/battle_datasource.dart';
import 'package:pokemon_app/features/battle/domain/entities/battle_entity.dart';
import 'package:pokemon_app/features/battle/domain/repositories/battle_repository.dart';

class BattleRepositoryImpl implements BattleRepository {
  final BattleDatasource datasource;

  BattleRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, BattleEntity>> startBattle(String selectedPokemonId) {
    return datasource.startBattle(selectedPokemonId);
  }
}
