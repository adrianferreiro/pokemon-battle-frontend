import 'package:dio/dio.dart';
import 'package:pokemon_app/config/constants/environment.dart';
import 'package:pokemon_app/core/error/either.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/battle/data/models/battle_model.dart';
import 'package:pokemon_app/features/battle/domain/datasources/battle_datasource.dart';
import 'package:pokemon_app/features/battle/domain/entities/battle_entity.dart';

class RemoteBattleDatasourceImpl implements BattleDatasource {
  final Dio dio;

  RemoteBattleDatasourceImpl({required this.dio});
  @override
  Future<Either<Failure, BattleEntity>> startBattle(
    String selectedPokemonId,
  ) async {
    try {
      final response = await dio.post(
        '${Environment.apiUrl}/battle',
        data: {"selectedPokemonId": selectedPokemonId},
      );
      if (response.statusCode == 201) {
        final battleModel = BattleModel.fromJson(response.data);
        return Right(battleModel.toEntity());
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(BattleFailure());
    }
  }
}
