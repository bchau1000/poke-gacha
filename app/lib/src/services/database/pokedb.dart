import 'package:http/http.dart' as http;
import '../../models/pokemon.dart';
import '../../models/pokemon-stats.dart';
import 'dart:convert';

class PokeDB {
  String baseUrl = 'http://10.0.2.2:5000';

  Future<List<Pokemon>> fetchPokemon(String query, int offset) async {
    final response = await http.get(baseUrl +
        '/api/pokedex?search=' +
        query +
        '&offset=' +
        offset.toString() +
        '&limit=12');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Pokemon> allPokemon = new List<Pokemon>();
      for (Map i in data) allPokemon.add(Pokemon.fromJson(i));
      return allPokemon;
    } else
      throw Exception('Failed to load Pokemon');
  }
}
