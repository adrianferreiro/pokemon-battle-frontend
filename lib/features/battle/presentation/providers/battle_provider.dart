import 'package:flutter/material.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/battle/domain/repositories/battle_repository.dart';
import 'package:pokemon_app/features/battle/presentation/providers/battle_state.dart';

class BattleProvider extends ChangeNotifier {
  final BattleRepository battleRepository;

  BattleState _state = BattleState.initial();

  BattleState get state => _state;

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
          );
          notifyListeners();
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
}
