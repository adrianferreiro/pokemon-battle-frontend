import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/providers.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/pokemon_state.dart';
import 'package:pokemon_app/features/pokemon/presentation/widget/widgets.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<PokemonProvider>(
      builder: (context, pokemonProvider, child) {
        PokemonState state = pokemonProvider.state;
        return SizedBox(
          height: size.height * 0.25,
          width: size.width,
          child: ListView.builder(
            itemCount: state.pokemons.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final PokemonEntity pokemon = state.pokemons[index];
              return PokemonCard(
                key: ValueKey(pokemon.id),
                pokemon: pokemon,
                onTap: () => pokemonProvider.selectPokemon(pokemon),
              );
            },
          ),
        );
      },
    );
  }
}
