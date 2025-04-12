import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokemon_app/config/constants/constants.dart';
import 'package:pokemon_app/features/battle/presentation/providers/providers.dart';
import 'package:pokemon_app/features/battle/presentation/providers/battle_state.dart';
import 'package:pokemon_app/features/battle/presentation/widgets/widgets.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/providers.dart';
import 'package:pokemon_app/features/pokemon/presentation/widget/widgets.dart';

class BattleScreen extends StatelessWidget {
  static const path = '/';
  static const name = 'battle-screen';
  const BattleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _BuildBody()));
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final battleProvider = Provider.of<BattleProvider>(context);
    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleScreen, style: textStyles.titleLarge),
          Text(subtitleScreen, style: textStyles.titleMedium),
          SelectPokemonWidget(),
          pokemonProvider.state.isLoading ? SizedBox() : BattleMessageBox(),
          if (pokemonProvider.state.selectedPokemon != null)
            Builder(
              builder: (_) {
                final selectedPokemon = pokemonProvider.state.selectedPokemon!;
                final pokemonName = selectedPokemon.name;
                return Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PokemonCard(
                        pokemon: selectedPokemon,
                        cardState:
                            battleProvider.state.status == BattleStatus.fighting
                                ? (battleProvider.state.isAttacker(pokemonName)
                                    ? PokemonCardState.selected
                                    : PokemonCardState.attacked)
                                : PokemonCardState.normal,
                        showStats: true,
                      ),
                    ),
                    StartBattleButton(),
                    Expanded(flex: 3, child: OpponentPokemonWidget()),
                  ],
                );
              },
            ),
          // Text(pokemonProvider.state.selectedPokemon!.name),
        ],
      ),
    );
  }
}
