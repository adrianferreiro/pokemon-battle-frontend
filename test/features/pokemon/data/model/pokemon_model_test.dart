import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/features/pokemon/data/model/pokemon_model.dart';

void main() {
  group('PokemonModel', () {
    final pokemonJson = {
      'id': 'pokemon-1',
      'name': 'Bulbasaur',
      'attack': 49,
      'defense': 49,
      'hp': 45,
      'speed': 45,
      'type': 'grass',
      'imageUrl': 'https://example.com/bulbasaur.png',
    };

    const pokemonModel = PokemonModel(
      id: 'pokemon-1',
      name: 'Bulbasaur',
      attack: 49,
      defense: 49,
      hp: 45,
      speed: 45,
      type: 'grass',
      imageUrl: 'https://example.com/bulbasaur.png',
    );

    test('fromJson should return valid PokemonModel', () {
      final result = PokemonModel.fromJson(pokemonJson);

      expect(result, isA<PokemonModel>());
      expect(result.id, equals('pokemon-1'));
      expect(result.name, equals('Bulbasaur'));
      expect(result.attack, equals(49));
      expect(result.defense, equals(49));
      expect(result.hp, equals(45));
      expect(result.speed, equals(45));
      expect(result.type, equals('grass'));
      expect(result.imageUrl, equals('https://example.com/bulbasaur.png'));
    });

    test('toJson should return a valid JSON map', () {
      final result = pokemonModel.toJson();

      expect(result, equals(pokemonJson));
    });
  });
}
