import 'package:equatable/equatable.dart';

//TODO:

abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message = 'An unexpected error occurred'});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = 'Error en el servidor.'});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Error de conexión de red.'});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Se produjo un error de caché.'});
}

class PokemonFailure extends Failure {
  const PokemonFailure({
    super.message = 'Error al obtener los datos de Pokémon.',
  });
}

class BattleFailure extends Failure {
  const BattleFailure({super.message = 'Error durante el proceso de batalla.'});
}
