import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/my_app.dart';
import 'package:pokemon_app/core/dependency_injection/dependency_injection.dart';

void main() {
  runApp(
    MultiProvider(
      providers: DependencyInjection().providers,
      child: const MyApp(),
    ),
  );
}
