import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';

// Container widget for the Pokemon grid item
// Create container for the sake of padding/organization
// EdgeInsets.all(x) is padding for all sides
// Column child widget automatically positions widgets from top to bottom
Widget pokemonGridItem(BuildContext context, Pokemon pokemon) {
  return new Stack(children: <Widget>[
    pokemonContainer(pokemon),
    Material(
      color: Colors.transparent,
      child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
          onTap: () {}),
    ),
  ]);
}

Widget pokemonContainer(Pokemon pokemon) {
  return new Container(
    decoration: BoxDecoration(
        color: Colors.grey[850], borderRadius: BorderRadius.circular(13.0)),
    child: Column(children: <Widget>[
      // Call the created widgets here, pass Pokemon object info respectively
      Center(child: Image.asset(pokemon.sprite, scale: 0.75)),
      Center(
        child: Text(
          pokemon.name,
          style: GoogleFonts.rubik(
              textStyle: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      )
    ]),
  );
}
