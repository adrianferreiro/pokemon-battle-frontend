import 'package:pokemon_app/core/error/either.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getPokemonList();
}
