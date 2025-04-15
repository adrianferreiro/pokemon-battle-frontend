import 'package:pokemon_app/core/error/either.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/core/network/api_paths.dart';
import 'package:pokemon_app/core/network/client/api_client.dart';
import 'package:pokemon_app/features/pokemon/data/mappers/pokemon_mappers.dart';
import 'package:pokemon_app/features/pokemon/domain/datasources/pokemon_datasource.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';

class RemotePokemonDatasourceImpl implements PokemonDatasource {
  final ApiClient apiClient;

  RemotePokemonDatasourceImpl({required this.apiClient});
  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemonList() async {
    try {
      final response = await apiClient.dio.get('${ApiPaths.getPokemonList}');
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
