import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';
import '../../../models/pokemon-info.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget pokemonStatsContainer(Pokemon pokemon, PokemonInfo info) {
  return Column(
    children: <Widget>[
      Flexible(flex: 2, child: pokemonPhysStats(pokemon)),
      Flexible(flex: 7, child: pokemonStatBars(info))
    ],
  );
}

Widget pokemonPhysStats(Pokemon pokemon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      statContainer(pokemon.rarity, 'Rarity'),
      statContainer(pokemon.weightLabel, 'Weight'),
      statContainer(pokemon.heightLabel, 'Height'),
    ],
  );
}

Widget statContainer(String value, String label) {
  return Column(children: <Widget>[
    Flexible(
        flex: 2,
        child: Center(
            child: Text(value,
                style:
                    GoogleFonts.openSans(fontSize: 25, color: Colors.white)))),
    Flexible(
        flex: 1,
        child: Container(
            child: Text(label,
                style: GoogleFonts.openSans(
                  color: Colors.grey[400],
                  fontSize: 15,
                ))))
  ]);
}

Widget pokemonStatBars(PokemonInfo info) {
  return Container(
      margin: EdgeInsets.all(15),
      child: Column(children: <Widget>[
        statBar('HP', info.hp, Colors.red[800]),
        statBar('ATK', info.att, Colors.orange[800]),
        statBar('DEF', info.def, Colors.yellow[800]),
        statBar('SATK', info.satk, Colors.blue[800]),
        statBar('SDEF', info.sdef, Colors.blue[400]),
        statBar('SPD', info.spd, Colors.green[800]),
      ]));
}

Widget statBar(String stat, int value, Color color) {
  String textValue = '';
  if (value < 10) {
    textValue = '00' + value.toString();
  } else if (value < 100) {
    textValue = '0' + value.toString();
  } else {
    textValue = value.toString();
  }

  double percent = value / 255;

  return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(children: <Widget>[
        Flexible(
            flex: 1,
            child: Container(
                height: 25,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(stat,
                        style: GoogleFonts.openSans(
                            fontSize: 15, color: Colors.grey[400]))))),
        Flexible(
            flex: 1,
            child: Container(
                height: 25,
                child: Center(
                    child: Text(textValue,
                        style: GoogleFonts.openSans(
                            fontSize: 15, color: Colors.grey[400]))))),
        Flexible(
          flex: 6,
          child: Container(
              height: 25,
              child: LinearPercentIndicator(
                lineHeight: 12.0,
                percent: percent,
                progressColor: color,
                backgroundColor: Colors.grey[900],
              )),
        )
      ]));
}
