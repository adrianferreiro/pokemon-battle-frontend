import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/entities.dart';

class PokemonState {
  final List<PokemonEntity> pokemons;
  final bool isLoading;
  final Failure? failure;
  final PokemonEntity? selectedPokemon;

  PokemonState({
    required this.pokemons,
    this.isLoading = false,
    this.failure,
    this.selectedPokemon,
  });

  PokemonState copyWith({
    List<PokemonEntity>? pokemons,
    bool? isLoading,
    Failure? failure,
    PokemonEntity? selectedPokemon,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
      selectedPokemon: selectedPokemon ?? this.selectedPokemon,
    );
  }

  static PokemonState initial() {
    return PokemonState(isLoading: true, pokemons: []);
  }
}
