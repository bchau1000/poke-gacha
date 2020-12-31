import 'package:flutter/material.dart';
import 'widgets/pokemon-info.dart';
import 'widgets/pokemon-header.dart';
import '../../bloc/pokemon-info-bloc.dart';
import '../../models/pokemon.dart';
import '../../models/pokemon-info.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonPage({Key key, @required this.pokemon}) : super(key: key);

  Widget build(BuildContext context) {
    final pokemonInfoBloc = PokemonInfoBloc(pokemon.id);
    pokemonInfoBloc.fetchInfo();
    return StreamBuilder(
        stream: pokemonInfoBloc.pokemonInfo,
        builder: (context, AsyncSnapshot<PokemonInfo> snapshot) {
          if (snapshot.hasData) {
            return buildScreen(context, pokemon, snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget buildScreen(BuildContext context, Pokemon pokemon, PokemonInfo info) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[900],
        body: Column(
          children: <Widget>[
            pokemonHeaderContainer(context, pokemon, info.types),
            pokemonInfoContainer(context, pokemon, info)
          ],
        ));
  }
}
