import 'dart:async';
import '../models/pokemon.dart';
import '../services/database/pokedb.dart';

class PokedexBloc {
  PokeDB service = new PokeDB();
  final pokemonFetcher = StreamController<List<Pokemon>>();

  Stream<List<Pokemon>> get pokemon => pokemonFetcher.stream;

  fetchPokemon(String query, int offset) async {
    final resp = await service.fetchPokemon(query, offset);
    pokemonFetcher.sink.add(resp);
  }

  dispose() {
    pokemonFetcher.close();
  }
}

final pokedexBloc = PokedexBloc();
