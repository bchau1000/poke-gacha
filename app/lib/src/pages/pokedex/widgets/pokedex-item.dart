import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';
import '../../pokemon-page/pokemon-page.dart';

class PokemonGridItem extends StatelessWidget {
  final Pokemon pokemon;
  PokemonGridItem({Key key, @required this.pokemon}) : super(key: key);

  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        pokemonContainer(),
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
            },
          ),
        ),
      ],
    );
  }

  Widget pokemonContainer() {
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
        pokemonLabel(),
        pokemonImage(),
      ]),
    );
  }

  Widget pokemonImage() {
    return Flexible(
      flex: 4,
      child: Hero(
        tag: pokemon.art,
        child: Container(
            decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(pokemon.art), fit: BoxFit.fitHeight))),
      ),
    );
  }

  Widget pokemonLabel() {
    return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 8),
                child: Text(
                  pokemon.nameLabel,
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
                '#' + pokemon.idLabel,
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
