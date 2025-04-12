import 'package:flutter/material.dart';
import 'package:pokemon_app/features/battle/presentation/widgets/battle_message_box.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/config/constants/constants.dart';
import 'package:pokemon_app/features/battle/presentation/widgets/opponent_pokemon_widget.dart';
import 'package:pokemon_app/features/battle/presentation/widgets/start_battle_button.dart';
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
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: PokemonCard(
                    pokemon: pokemonProvider.state.selectedPokemon!,
                    showStats: true,
                  ),
                ),
                StartBattleButton(),
                Expanded(flex: 3, child: OpponentPokemonWidget()),
              ],
            ),
          // Text(pokemonProvider.state.selectedPokemon!.name),
        ],
      ),
    );
  }
}
