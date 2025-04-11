import 'package:pokemon_app/features/pokemon/domain/entities/entities.dart';

class PokemonMappers {
  static List<PokemonEntity> fromResponseToEntities(dynamic responseData) {
    if (responseData == null || responseData is! Map<String, dynamic>) {
      throw FormatException('Formato de respuesta inválido');
    }

    final pokemonList = responseData['pokemon'];
    if (pokemonList == null || pokemonList is! List) {
      throw FormatException('Lista de pokemon no encontrada o inválida');
    }

    return pokemonList
        .map<PokemonEntity>((json) => PokemonEntity.fromJson(json))
        .toList();
  }
}
