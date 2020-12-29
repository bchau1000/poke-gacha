import 'dart:async';
import '../models/pokemon-info.dart';
import '../services/database/pokedb.dart';

class PokemonInfoBloc {
  PokeDB service = new PokeDB();
  final infoFetcher = StreamController<PokemonInfo>();

  final String id;
  PokemonInfoBloc(this.id);

  Stream<PokemonInfo> get pokemonInfo => infoFetcher.stream;

  fetchInfo() async {
    final resp = await service.fetchPokemonInfo(id);
    infoFetcher.sink.add(resp);
  }

  dispose() {
    infoFetcher.close();
  }
}
