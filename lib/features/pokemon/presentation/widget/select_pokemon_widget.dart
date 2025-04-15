import 'package:flutter/material.dart';
import 'package:pokemon_app/config/constants/constants.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/pokemon_state.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/providers.dart';
import 'package:pokemon_app/features/pokemon/presentation/widget/widgets.dart';
import 'package:provider/provider.dart';

class SelectPokemonWidget extends StatelessWidget {
  const SelectPokemonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Consumer<PokemonProvider>(
      builder: (context, pokemonProvider, child) {
        PokemonState state = pokemonProvider.state;
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.failure != null) {
          return Text(
            state.failure!.message,
            style: textStyle.labelMedium?.copyWith(color: Colors.red),
          );
        }
        if (state.pokemons.isEmpty) {
          return const Center(child: Text(pokemonListEmpty));
        }
        return const PokemonListView();
      },
    );
  }
}
