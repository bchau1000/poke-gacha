import 'dart:async';
import '../models/pokemon.dart';
import '../services/database/pokedb.dart';

class PokedexBloc {
  PokeDB service = new PokeDB();
  final pokemonFetcher = StreamController<List<Pokemon>>();

  Stream<List<Pokemon>> get pokemon => pokemonFetcher.stream;

  fetchPokemon() async {
    final resp = await service.fetchPokemon();
    pokemonFetcher.sink.add(resp);
  }

  dispose() {
    pokemonFetcher.close();
  }
}

final pokedexBloc = PokedexBloc();
