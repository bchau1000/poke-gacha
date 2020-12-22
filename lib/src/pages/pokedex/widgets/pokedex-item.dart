import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';

// Container widget for the Pokemon grid item
// Create container for the sake of padding/organization
// EdgeInsets.all(x) is padding for all sides
// Column child widget automatically positions widgets from top to bottom
Widget pokemonContainer(BuildContext context, Pokemon pokemon) {
  return new InkWell(
    borderRadius: BorderRadius.circular(13.0),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[850], borderRadius: BorderRadius.circular(13.0)),
      child: Column(children: <Widget>[
        // Call the created widgets here, pass Pokemon object info respectively
        pokemonSprite(pokemon.sprite),
        pokemonLabel(pokemon.name)
      ]),
    ),
    onTap: () {
      Navigator.pushNamed(context, '/pokemon');
    },
  );
}

// Widget for the sprite itself, lower scale = larger image
Widget pokemonSprite(String sprite) {
  return Center(child: Image.asset(sprite, scale: 0.75));
}

// Widget for the label at the bottom of the container, centered
Widget pokemonLabel(String name) {
  return Center(
    child: Text(
      name,
      style: GoogleFonts.rubik(
          textStyle: TextStyle(fontSize: 18, color: Colors.white)),
    ),
  );
}
