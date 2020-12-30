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
  List<Pokemon> allPokemon = [];

  @override
  Widget build(BuildContext context) {
    pokedexBloc.fetchPokemon('', allPokemon.length);

    return StreamBuilder(
        stream: pokedexBloc.pokemon,
        builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
          if (snapshot.hasData) {
            allPokemon = snapshot.data;
            return buildPokedex();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget buildPokedex() {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        backgroundColor: Colors.grey[900],
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification.metrics.pixels ==
                scrollNotification.metrics.maxScrollExtent) {
              setState(() {});
            }
            return true;
          },
          child: GridView.builder(
            // primary: false -> makes the amount you can scroll relative to the content in the grid
            primary: false,
            itemCount: allPokemon.length,
            padding: const EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
            ),
            // Call getPokemon for the list of widgets here
            itemBuilder: (BuildContext context, int index) {
              return pokemonGridItem(context, allPokemon[index]);
            },
          ),
        ));
  }
}
