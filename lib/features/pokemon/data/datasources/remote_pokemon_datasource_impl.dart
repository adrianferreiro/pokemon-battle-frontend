import 'package:dio/dio.dart';
import 'package:pokemon_app/core/error/either.dart';
import 'package:pokemon_app/config/constants/environment.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/pokemon/data/mappers/pokemon_mappers.dart';
import 'package:pokemon_app/features/pokemon/domain/datasources/pokemon_datasource.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';

class RemotePokemonDatasourceImpl implements PokemonDatasource {
  final Dio dio;

  RemotePokemonDatasourceImpl({required this.dio});
  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemonList() async {
    try {
      final response = await dio.get('${Environment.apiUrl}/pokemon');
      if (response.statusCode == 200) {
        final pokemonList = PokemonMappers.fromResponseToEntities(
          response.data,
        );
        return Right(pokemonList);
      } else {
        return Left(
          ServerFailure(
            message: 'Error en el servidor: código ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(PokemonFailure(message: e.toString()));
    }
  }
}
