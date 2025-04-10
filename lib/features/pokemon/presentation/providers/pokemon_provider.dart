import 'package:flutter/material.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/entities.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/pokemon_state.dart';

class PokemonProvider extends ChangeNotifier {
  final PokemonRepository pokemonRepository;

  PokemonState _state = PokemonState.initial();

  PokemonState get state => _state;

  PokemonProvider({required this.pokemonRepository});

  Future<void> fetchPokemons() async {
    try {
      _state = _state.copyWith(isLoading: true);
      notifyListeners();
      final response = await pokemonRepository.getPokemonList();
      response.fold(
        (left) {
          _state = _state.copyWith(isLoading: false, failure: left);
        },
        (right) {
          _state = _state.copyWith(isLoading: false, pokemons: right);
        },
      );
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        failure: PokemonFailure(message: e.toString()),
      );
      notifyListeners();
    }
  }

  selectPokemon(PokemonEntity value) {
    _state = _state.copyWith(selectedPokemon: value);
    notifyListeners();
  }
}
