import 'package:flutter/material.dart';

enum PokemonCardState { normal, selected, attacked }

Color getPokemonCardBackgroundColor(
  BuildContext context,
  PokemonCardState state,
) {
  switch (state) {
    case PokemonCardState.attacked:
      return Colors.red.withAlpha(50);
    case PokemonCardState.selected:
      return Theme.of(context).primaryColor.withAlpha(40);
    case PokemonCardState.normal:
      return Colors.white;
  }
}
