import 'package:flutter/material.dart';
import 'widgets/pokedex-item.dart';
import '../../bloc/pokedex-bloc.dart';
import '../../models/pokemon.dart';
import 'package:google_fonts/google_fonts.dart';

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
  int offset = 0;
  final searchController = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    pokedexBloc.fetchPokemon(this.query, offset);

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

  Icon subIcon = Icon(Icons.search);
  Widget subSearchBar = Text('Pokédex');

  Widget buildPokedex() {
    return Scaffold(
      appBar: AppBar(title: subSearchBar, actions: <Widget>[
        IconButton(
            onPressed: () {
              setState(() {
                if (this.subIcon.icon == Icons.search) {
                  this.subIcon = Icon(Icons.clear);
                  this.subSearchBar = TextField(
                    controller: searchController,
                    style:
                        GoogleFonts.openSans(color: Colors.white, fontSize: 16),
                    onSubmitted: (String str) {
                      setState(() {
                        this.query = str;
                      });
                    },
                  );
                } else {
                  this.subIcon = Icon(Icons.search);
                  this.subSearchBar = Text('Pokédex');
                }
              });
            },
            icon: subIcon)
      ]),
      backgroundColor: Colors.grey[900],
      body: GridView.builder(
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
          return PokemonGridItem(pokemon: allPokemon[index]);
        },
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

/*
GridView.builder(
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
*/
