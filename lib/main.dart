import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/config/router/app_router.dart';
import 'package:pokemon_app/features/battle/data/datasources/datasources.dart';
import 'package:pokemon_app/features/battle/data/repositories/battle_repository_impl.dart';
import 'package:pokemon_app/features/battle/presentation/providers/providers.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/datasources.dart';
import 'package:pokemon_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/providers.dart';

void main() {
  final dio = Dio();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) => PokemonProvider(
                pokemonRepository: PokemonRepositoryImpl(
                  RemotePokemonDatasourceImpl(dio: dio),
                ),
              )..fetchPokemons(),
        ),
        ChangeNotifierProvider(
          create:
              (_) => BattleProvider(
                battleRepository: BattleRepositoryImpl(
                  RemoteBattleDatasourceImpl(dio: dio),
                ),
              ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Batalla Pokemón',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
