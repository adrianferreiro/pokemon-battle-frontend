import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/battle/domain/repositories/battle_repository.dart';
import 'package:pokemon_app/features/battle/presentation/providers/battle_state.dart';

class BattleProvider extends ChangeNotifier {
  final BattleRepository battleRepository;

  BattleState _state = BattleState.initial();

  BattleState get state => _state;
  Timer? _turnTimer;

  BattleProvider({required this.battleRepository});

  Future<void> startBattle({required String selectedPokemonId}) async {
    _state = _state.copyWith(status: BattleStatus.loading);
    notifyListeners();
    try {
      final response = await battleRepository.startBattle(selectedPokemonId);
      response.fold(
        (left) {
          _state = _state.copyWith(status: BattleStatus.error, failure: left);
          notifyListeners();
        },
        (right) {
          _state = _state.copyWith(
            battle: right,
            status: BattleStatus.fighting,
            currentTurnIndex: 0,
          );
          notifyListeners();
          _startTurnSimulation();
        },
      );
    } catch (e) {
      _state = _state.copyWith(
        status: BattleStatus.error,
        failure: BattleFailure(),
      );
      notifyListeners();
    }
  }

  void _startTurnSimulation() {
    _turnTimer?.cancel();
    if (_state.battle == null || _state.battle!.turns.isEmpty) return;
    const turnDuration = Duration(seconds: 2);
    _turnTimer = Timer.periodic(turnDuration, (timer) {
      if (_state.currentTurnIndex >= _state.battle!.turns.length - 1) {
        timer.cancel();
        Future.delayed(turnDuration, () {
          _state = _state.copyWith(status: BattleStatus.finished);
          notifyListeners();
        });
      } else {
        _state = _state.copyWith(currentTurnIndex: _state.currentTurnIndex + 1);
        notifyListeners();
      }
    });
  }

  void resetBattle() {
    _turnTimer?.cancel();
    _turnTimer = null;
    _state = BattleState.initial();
    notifyListeners();
  }

  @override
  void dispose() {
    _turnTimer?.cancel();
    super.dispose();
  }
}
