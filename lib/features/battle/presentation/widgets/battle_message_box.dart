import 'package:flutter/material.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/features/battle/presentation/providers/battle_state.dart';
import 'package:pokemon_app/features/battle/presentation/providers/providers.dart';

class BattleMessageBox extends StatelessWidget {
  const BattleMessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    final battleState = Provider.of<BattleProvider>(context).state;
    final pokemonState = Provider.of<PokemonProvider>(context).state;
    String message = '';
    switch (battleState.status) {
      case BattleStatus.initial:
        pokemonState.failure == null
            ? message = 'Battlefield ready.'
            : message = 'An error ocurred.';
        break;
      case BattleStatus.loading:
        message = 'Getting opponent.';
        break;
      case BattleStatus.fighting:
        final turn = battleState.battle?.turns[battleState.currentTurnIndex];
        message =
            turn != null
                ? '${turn.attacker} attacks ${turn.defender} and deals ${turn.damage} damage.'
                : 'The battle begins!';
        break;
      case BattleStatus.finished:
        message = '${battleState.battle?.winner.name} wins!';
        break;
      case BattleStatus.error:
        message = 'An error occurred.';
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 8,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
