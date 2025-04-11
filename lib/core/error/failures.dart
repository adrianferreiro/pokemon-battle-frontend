import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message = 'An unexpected error occurred'});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = 'Server error.'});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Network connection error.'});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'A cache error occurred.'});
}

class PokemonFailure extends Failure {
  const PokemonFailure({super.message = 'Error retrieving Pokemon data.'});
}

class BattleFailure extends Failure {
  const BattleFailure({super.message = 'Error during battle process.'});
}
