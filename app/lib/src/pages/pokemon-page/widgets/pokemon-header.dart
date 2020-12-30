import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';

Widget pokemonHeaderContainer(
    BuildContext context, Pokemon pokemon, List<dynamic> types) {
  return new Flexible(
      flex: 9,
      child: Stack(children: <Widget>[
        pokemonPlatform(),
        Column(children: [
          pokemonLabelContainer(pokemon.idLabel, pokemon.nameLabel),
          pokemonTypesContainer(types),
          pokemonImageContainer(pokemon.art)
        ]),
      ]));
}

Widget pokemonImageContainer(String art) {
  return Flexible(
      flex: 8,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(art), fit: BoxFit.fitHeight)))));
}

Widget pokemonLabelContainer(String id, String name) {
  return Flexible(
      flex: 2,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 8),
                child: Text(name,
                    style: GoogleFonts.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
            Container(
                padding: EdgeInsets.only(right: 8, bottom: 3),
                child: Text('#' + id,
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)))
          ]));
}

Widget pokemonTypesContainer(List<dynamic> types) {
  List<Widget> typeWidgets = [];

  for (int i = 0; i < types.length; i++)
    typeWidgets.add(pokemonType(types[i].toString(), Colors.grey[850]));

  return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: typeWidgets,
      ));
}

Widget pokemonType(String type, Color color) {
  return Container(
      margin: EdgeInsets.only(left: 9),
      padding: EdgeInsets.only(top: 3, bottom: 3, right: 20, left: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Text(type,
          style: GoogleFonts.openSans(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)));
}

Widget pokemonPlatform() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.end, // start at end/bottom of column
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        )
      ]);
}
