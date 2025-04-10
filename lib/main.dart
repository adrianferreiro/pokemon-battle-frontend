import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/config/router/app_router.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/local_pokemon_datasource_impl.dart';
import 'package:pokemon_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_app/features/pokemon/presentation/providers/pokemon_provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create:
            (_) => PokemonProvider(
              pokemonRepository: PokemonRepositoryImpl(
                LocalPokemonDatasourceImpl(),
              ),
            )..fetchPokemons(),
      ),
    ],
    child: MyApp(),
  ),
);

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
