import 'package:flutter/material.dart';
import 'package:pokemon_app/features/battle/data/mappers/battle_mappers.dart';
import 'package:pokemon_app/features/battle/presentation/providers/battle_state.dart';
import 'package:pokemon_app/features/battle/presentation/providers/providers.dart';
import 'package:pokemon_app/features/pokemon/presentation/widget/widgets.dart';
import 'package:provider/provider.dart';

class OpponentPokemonWidget extends StatelessWidget {
  const OpponentPokemonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BattleProvider>(
      builder: (context, battleProvider, child) {
        if (battleProvider.state.status == BattleStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (battleProvider.state.status == BattleStatus.error) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 15,
                children: [
                  Icon(Icons.cancel, color: Colors.red),
                  Text(
                    battleProvider.state.failure!.message,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        }
        return battleProvider.state.battle != null
            ? PokemonCard(
              pokemon: BattleMappers.battlePokemonToPokemonEntity(
                battleProvider.state.battle!.opponentPokemon,
              ),
              showStats: true,
            )
            : PokemonCard();
      },
    );
  }
}
