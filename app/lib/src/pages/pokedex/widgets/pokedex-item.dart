import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';
import '../../pokemon-page/pokemon-page.dart';

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
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PokemonPage(pokemon: pokemon)));
          }),
    ),
  ]);
}

Widget pokemonContainer(Pokemon pokemon) {
  return new Container(
    decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(13.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(2, 3))
        ]),
    child: Column(children: <Widget>[
      // Call the created widgets here, pass Pokemon object info respectively
      pokemonLabel(pokemon.nameLabel, pokemon.idLabel),
      pokemonImage(pokemon.art),
    ]),
  );
}

Widget pokemonImage(String art) {
  return Flexible(
      flex: 4,
      child: Container(
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(art), fit: BoxFit.fitHeight))));
}

Widget pokemonLabel(String label, String id) {
  return Flexible(
      flex: 1,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 8),
              child: Text(
                label,
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            )),
        Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(right: 10, top: 8),
              child: Text(
                '#' + id,
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ))
      ]));
}
