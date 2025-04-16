class ApiPaths {
  static const _baseUrl =
      'https://pokemon-battle-backend-production.up.railway.app/';

  static const _getPokemonList = 'pokemon';
  static const _startBattle = 'battle';

  static get baseUrl => _baseUrl;
  static get getPokemonList => _getPokemonList;
  static get startBattle => _startBattle;
}
