import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:pokemon_app/core/network/api_paths.dart';
import 'package:pokemon_app/core/network/client/api_client.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/datasources.dart';
import 'package:pokemon_app/features/pokemon/domain/datasources/pokemon_datasource.dart';
import 'package:pokemon_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/providers.dart';
import 'package:pokemon_app/features/battle/data/datasources/datasources.dart';
import 'package:pokemon_app/features/battle/domain/datasources/battle_datasource.dart';
import 'package:pokemon_app/features/battle/data/repositories/battle_repository_impl.dart';
import 'package:pokemon_app/features/battle/domain/repositories/battle_repository.dart';
import 'package:pokemon_app/features/battle/presentation/providers/providers.dart';

class DependencyInjection {
  static final DependencyInjection _instance = DependencyInjection._internal();

  factory DependencyInjection() => _instance;

  DependencyInjection._internal();

  List<SingleChildWidget> get providers => [
    Provider<Dio>(
      create: (_) => Dio()..options = BaseOptions(baseUrl: ApiPaths.baseUrl),
    ),
    Provider<ApiClient>(
      create: (context) => ApiClient(dio: context.read<Dio>()),
    ),

    // Datasources
    Provider<PokemonDatasource>(
      create:
          (context) =>
              RemotePokemonDatasourceImpl(apiClient: context.read<ApiClient>()),
    ),
    Provider<BattleDatasource>(
      create:
          (context) =>
              RemoteBattleDatasourceImpl(apiClient: context.read<ApiClient>()),
    ),

    // Repositories
    Provider<PokemonRepository>(
      create:
          (context) => PokemonRepositoryImpl(context.read<PokemonDatasource>()),
    ),
    Provider<BattleRepository>(
      create:
          (context) => BattleRepositoryImpl(context.read<BattleDatasource>()),
    ),

    ChangeNotifierProvider<PokemonProvider>(
      create:
          (context) => PokemonProvider(
            pokemonRepository: context.read<PokemonRepository>(),
          )..fetchPokemons(),
    ),
    ChangeNotifierProvider<BattleProvider>(
      create:
          (context) => BattleProvider(
            battleRepository: context.read<BattleRepository>(),
          ),
    ),
  ];
}
