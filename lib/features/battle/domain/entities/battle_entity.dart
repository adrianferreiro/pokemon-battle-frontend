class BattleEntity {
  final BattlePokemonData playerPokemon;
  final BattlePokemonData opponentPokemon;
  final List<Turn> turns;
  final Winner winner;
  final int totalTurns;

  BattleEntity({
    required this.playerPokemon,
    required this.opponentPokemon,
    required this.turns,
    required this.winner,
    required this.totalTurns,
  });
}

class BattlePokemonData {
  final String id;
  final String name;
  final int attack;
  final int defense;
  final int hpInitial;
  final int hpFinal;
  final int speed;
  final String type;
  final String imageUrl;
  final int totalDamageDealt;

  BattlePokemonData({
    required this.id,
    required this.name,
    required this.attack,
    required this.defense,
    required this.hpInitial,
    required this.hpFinal,
    required this.speed,
    required this.type,
    required this.imageUrl,
    required this.totalDamageDealt,
  });
}

class Turn {
  final int turn;
  final String attacker;
  final String defender;
  final int damage;
  final int defenderRemainingHp;

  Turn({
    required this.turn,
    required this.attacker,
    required this.defender,
    required this.damage,
    required this.defenderRemainingHp,
  });
}

class Winner {
  final String id;
  final String name;
  final String imageUrl;

  Winner({required this.id, required this.name, required this.imageUrl});
}
