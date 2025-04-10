import 'package:flutter/material.dart';
import 'package:pokemon_app/config/constants/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleScreen, style: textStyles.titleLarge),
          Text(subtitleScreen, style: textStyles.titleMedium),
          SelectPokemonWidget(),
        ],
      ),
    );
  }
}
