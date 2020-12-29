import 'package:http/http.dart' as http;
import '../../models/pokemon.dart';
import 'dart:convert';

class PokeDB {
  String baseUrl = '10.0.2.2:4444';

  Future<Pokemon> testGet() async {
    final response = await http.get(new Uri.http(baseUrl, '/pokedex'));
    if (response.statusCode == 200)
      return Pokemon.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to load Pokemon');
  }
}
