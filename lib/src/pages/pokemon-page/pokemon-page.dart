import 'package:flutter/material.dart';
import 'widgets/pokemon-info.dart';
import 'widgets/pokemon-header.dart';
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
            pokemonHeaderContainer(context, pokemon),
            pokemonInfoContainer(context, pokemon)
          ],
        ));
  }
}
