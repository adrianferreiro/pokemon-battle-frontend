import 'package:pokemon_app/core/error/either.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/core/network/api_paths.dart';
import 'package:pokemon_app/core/network/client/api_client.dart';
import 'package:pokemon_app/features/battle/data/models/battle_model.dart';
import 'package:pokemon_app/features/battle/domain/datasources/battle_datasource.dart';
import 'package:pokemon_app/features/battle/domain/entities/battle_entity.dart';

class RemoteBattleDatasourceImpl implements BattleDatasource {
  final ApiClient apiClient;

  RemoteBattleDatasourceImpl({required this.apiClient});
  @override
  Future<Either<Failure, BattleEntity>> startBattle(
    String selectedPokemonId,
  ) async {
    try {
      final response = await apiClient.dio.post(
        '${ApiPaths.startBattle}',
        data: {"selectedPokemonId": selectedPokemonId},
      );
      if (response.statusCode == 201) {
        final battleModel = BattleModel.fromJson(response.data);
        return Right(battleModel.toEntity());
      } else {
        return Left(const ServerFailure());
      }
    } catch (e) {
      return Left(const BattleFailure());
    }
  }
}
