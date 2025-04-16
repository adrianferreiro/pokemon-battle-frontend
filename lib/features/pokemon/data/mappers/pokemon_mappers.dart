import 'package:pokemon_app/features/pokemon/domain/entities/entities.dart';
import 'package:pokemon_app/features/pokemon/data/models/pokemon_model.dart';

class PokemonMappers {
  static List<PokemonEntity> fromResponseToEntities(dynamic responseData) {
    if (responseData == null || responseData is! Map<String, dynamic>) {
      throw const FormatException('Formato de respuesta inválido');
    }

    final pokemonList = responseData['pokemon'];
    if (pokemonList == null || pokemonList is! List) {
      throw const FormatException('Lista de pokemon no encontrada o inválida');
    }

    return pokemonList
        .map<PokemonEntity>((json) => PokemonModel.fromJson(json))
        .toList();
  }
}
