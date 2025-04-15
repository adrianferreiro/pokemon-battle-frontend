import 'package:flutter/material.dart';
import 'package:pokemon_app/config/router/app_router.dart';

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
