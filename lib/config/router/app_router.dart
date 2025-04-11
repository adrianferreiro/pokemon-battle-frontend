import 'package:go_router/go_router.dart';
import 'package:pokemon_app/features/battle/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: BattleScreen.path,
      name: BattleScreen.name,
      builder: (context, state) {
        return BattleScreen();
      },
      routes: [],
    ),
  ],
);
