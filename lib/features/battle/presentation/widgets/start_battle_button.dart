import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/features/battle/presentation/providers/providers.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/providers.dart';
import 'package:pokemon_app/features/battle/presentation/providers/battle_state.dart';

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
          onPressed:
              (battleProvider.state.status == BattleStatus.fighting ||
                      battleProvider.state.status == BattleStatus.loading)
                  ? null
                  : () {
                    final selectedPokemonId =
                        pokemonProvider.state.selectedPokemon!.id;
                    battleProvider.startBattle(
                      selectedPokemonId: selectedPokemonId,
                    );
                  },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[800],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            elevation: 4,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(
            battleProvider.state.status == BattleStatus.fighting
                ? 'Fighting'
                : 'Start Battle',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
