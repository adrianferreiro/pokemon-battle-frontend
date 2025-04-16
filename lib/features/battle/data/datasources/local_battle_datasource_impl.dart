import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pokemon_app/core/error/either.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/battle/data/models/models.dart';
import 'package:pokemon_app/features/battle/domain/datasources/battle_datasource.dart';
import 'package:pokemon_app/features/battle/domain/entities/entities.dart';

class LocalBattleDatasourceImpl implements BattleDatasource {
  @override
  Future<Either<Failure, BattleEntity>> startBattle(
    String selectedPokemonId,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      final String jsonResponse = await rootBundle.loadString(
        'assets/mocks/battle/battle.json',
      );

      final response = json.decode(jsonResponse) as Map<String, dynamic>;
      final BattleModel battleModel = BattleModel.fromJson(response);
      return Right(battleModel.toEntity());
    } catch (e) {
      return Left(const BattleFailure());
    }
  }
}
