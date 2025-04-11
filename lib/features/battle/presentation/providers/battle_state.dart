import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/battle/domain/entities/entities.dart';

enum BattleStatus { initial, loading, fighting, finished, error }

class BattleState {
  final BattleEntity? battle;
  final Failure? failure;
  final BattleStatus status;

  BattleState({required this.battle, required this.status, this.failure});

  BattleState copyWith({
    BattleEntity? battle,
    Failure? failure,
    BattleStatus? status,
  }) {
    return BattleState(
      battle: battle ?? this.battle,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }

  static BattleState initial() {
    return BattleState(battle: null, status: BattleStatus.initial);
  }
}
