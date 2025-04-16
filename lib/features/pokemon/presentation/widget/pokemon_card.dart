import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_app/config/constants/pokemon.dart';
import 'package:pokemon_app/features/battle/presentation/providers/battle_provider.dart';
import 'package:pokemon_app/features/battle/presentation/providers/battle_state.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/features/pokemon/presentation/widget/widgets.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity? pokemon;
  final VoidCallback? onTap;
  final bool showStats;
  final double? width;
  final double? height;
  final String placeholderText;
  final PokemonCardState cardState;

  const PokemonCard({
    super.key,
    this.pokemon,
    this.onTap,
    this.showStats = false,
    this.width,
    this.height,
    this.placeholderText = cardPlaceholderText,
    this.cardState = PokemonCardState.normal,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          elevation: cardState == PokemonCardState.selected ? 8 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side:
                cardState == PokemonCardState.selected
                    ? BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )
                    : BorderSide.none,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: width,
            height: height,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: getPokemonCardBackgroundColor(context, cardState),
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                pokemon == null
                    ? _buildPlaceholder(context)
                    : _buildPokemonContent(textStyles, width ?? 40),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.help_outline, size: 60, color: Colors.grey),
        Text(
          placeholderText,
          style: const TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPokemonContent(TextTheme textStyles, double size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Center(
            child: CachedNetworkImage(
              imageUrl: pokemon!.imageUrl,
              placeholder:
                  (context, url) => Center(
                    child: SizedBox(
                      height: size / 4,
                      width: size / 4,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          pokemon!.name,
          style: textStyles.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        if (showStats)
          Consumer<BattleProvider>(
            builder: (context, battleProvider, child) {
              BattleStatus status = battleProvider.state.status;
              bool highlightHpBarRed =
                  status == BattleStatus.fighting ||
                  status == BattleStatus.finished;
              int currentHp = pokemon!.hp;
              if (battleProvider.state.battle != null) {
                currentHp = battleProvider.getPokemonCurrentHp(pokemon!.name);
              }
              return Column(
                spacing: 5,
                children: [
                  const Divider(),
                  StatBarWidget(
                    label: "HP",
                    value: currentHp,
                    backgroundColor: highlightHpBarRed ? Colors.red : null,
                  ),
                  StatBarWidget(label: "Attack", value: pokemon!.attack),
                  StatBarWidget(label: "Defense", value: pokemon!.defense),
                  StatBarWidget(label: "Speed", value: pokemon!.speed),
                ],
              );
            },
          ),
      ],
    );
  }
}
