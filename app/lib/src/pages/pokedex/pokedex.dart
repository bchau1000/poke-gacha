import 'package:flutter/material.dart';
import 'widgets/pokedex-item.dart';
import '../../bloc/pokedex-bloc.dart';
import '../../models/pokemon.dart';

// Bring all the widgets together here to create a grid view widget
class Pokedex extends StatefulWidget {
  // Constructor for the widget class
  final String title;

  Pokedex({Key key, @required this.title}) : super(key: key);

  @override
  PokedexState createState() => PokedexState();
}

class PokedexState extends State<Pokedex> {
  List<Widget> getPokemon(BuildContext context, List<Pokemon> allPokemon) {
    List<Widget> pokemonItems = [];
    for (int i = 0; i < allPokemon.length; i++)
      pokemonItems.add(pokemonGridItem(context, allPokemon[i]));
    return pokemonItems;
  }

  @override
  Widget build(BuildContext context) {
    pokedexBloc.fetchPokemon();
    return StreamBuilder(
        stream: pokedexBloc.pokemon,
        builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
          if (snapshot.hasData) {
            return buildPokedex(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget buildPokedex(List<Pokemon> allPokemon) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        backgroundColor: Colors.grey[900],
        body: GridView.count(
          // primary: false -> makes the amount you can scroll relative to the content in the grid
          primary: false,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 3,
          // Call getPokemon for the list of widgets here
          children: getPokemon(context, allPokemon),
        ));
  }
}
