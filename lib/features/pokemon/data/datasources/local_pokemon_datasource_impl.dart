import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pokemon_app/core/error/errors.dart';
import 'package:pokemon_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/entities.dart';
import 'package:pokemon_app/features/pokemon/domain/datasources/pokemon_datasource.dart';

class LocalPokemonDatasourceImpl implements PokemonDatasource {
  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemonList() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final String jsonResponse = await rootBundle.loadString(
        'assets/mocks/pokemon/pokemon_list.json',
      );

      final response = json.decode(jsonResponse) as Map<String, dynamic>;
      final List<dynamic> jsonList = response['pokemon'];
      final List<PokemonEntity> pokemons =
          jsonList
              .map(
                (json) => PokemonModel.fromJson(json as Map<String, dynamic>),
              )
              .toList();

      return Right(pokemons);
    } on ServerException {
      return Left(const ServerFailure());
    } on SocketException {
      return Left(const NetworkFailure());
    } catch (e) {
      return Left(PokemonFailure(message: e.toString()));
    }
  }
}
