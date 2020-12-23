import 'package:flutter/material.dart';
import 'widgets/pokemon-info.dart';
import 'widgets/pokemon-image.dart';
import '../../models/pokemon.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;
  PokemonPage({Key key, @required this.pokemon}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[900],
        body: Column(
          children: <Widget>[
            pokemonImageContainer(context, pokemon),
            pokemonInfoContainer(context, pokemon)
          ],
        ));
  }
}
