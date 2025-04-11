import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/features/battle/presentation/providers/providers.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/providers.dart';

class StartBattleButton extends StatelessWidget {
  const StartBattleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);
    final battleProvider = Provider.of<BattleProvider>(context);
    return Expanded(
      flex: 2,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            final selectedPokemonId = pokemonProvider.state.selectedPokemon!.id;
            battleProvider.startBattle(selectedPokemonId: selectedPokemonId);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),

          child: const Text('Start Battle', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
