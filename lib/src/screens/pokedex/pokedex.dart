import 'package:flutter/material.dart';
import 'widgets/pokedex-item.dart';
import '../../models/pokemon.dart';

// Bring all the widgets together here to create a grid view widget
class Pokedex extends StatelessWidget {
  // No clue what the two lines below do, assuming it's just weird syntax for a constructor
  Pokedex({Key key, this.title}) : super(key: key);
  final String title;

  // Create a list of pokemon container widgets to populate the grid
  List<Widget> getPokemon(BuildContext context) {
    List<Widget> allPokemon = [];

    // Start at 1 since bulbsaur's id in PokeAPI is 1
    // Temporary loop for the sake of testing
    for (int i = 1; i < 12; i++)
      allPokemon.add(pokemonContainer(Pokemon('Pokemon', i)));

    return allPokemon;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: GridView.count(
          // primary: false -> makes the amount you can scroll relative to the content in the grid
          primary: false,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          crossAxisCount: 2,
          // Call getPokemon for the list of widgets here
          children: getPokemon(context),
        ));
  }
}
