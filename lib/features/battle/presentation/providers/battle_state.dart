import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/battle/domain/entities/entities.dart';

enum BattleStatus { initial, loading, fighting, finished, error }

class BattleState {
  final BattleEntity? battle;
  final Failure? failure;
  final BattleStatus status;
  final int currentTurnIndex;

  BattleState({
    required this.battle,
    required this.status,
    this.failure,
    this.currentTurnIndex = 0,
  });

  BattleState copyWith({
    BattleEntity? battle,
    Failure? failure,
    BattleStatus? status,
    int? currentTurnIndex,
  }) {
    return BattleState(
      battle: battle ?? this.battle,
      failure: failure ?? this.failure,
      status: status ?? this.status,
      currentTurnIndex: currentTurnIndex ?? this.currentTurnIndex,
    );
  }

  static BattleState initial() {
    return BattleState(battle: null, status: BattleStatus.initial);
  }

  Turn? get currentTurn {
    if (battle == null || battle!.turns.isEmpty) return null;
    if (currentTurnIndex >= battle!.turns.length) return null;
    return battle!.turns[currentTurnIndex];
  }

  bool isAttacker(String pokemonName) {
    return currentTurn?.attacker == pokemonName;
  }
}
