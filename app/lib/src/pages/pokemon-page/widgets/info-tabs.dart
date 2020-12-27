import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget pokemonStatsContainer(Pokemon pokemon) {
  return Column(
    children: <Widget>[
      Flexible(flex: 2, child: pokemonPhysStats()),
      Flexible(flex: 7, child: pokemonStatBars())
    ],
  );
}

Widget pokemonPhysStats() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      statContainer('3', 'Rarity'),
      statContainer('6.9 KG', 'Weight'),
      statContainer('0.7 M', 'Height'),
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

Widget pokemonStatBars() {
  return Container(
      margin: EdgeInsets.all(15),
      child: Column(children: <Widget>[
        statBar('HP', 50),
        statBar('ATK', 25),
        statBar('DEF', 70),
        statBar('SATK', 200),
        statBar('SDEF', 30),
        statBar('SPD', 75),
      ]));
}

Widget statBar(String stat, int value) {
  String textValue = '';
  if (value < 10) {
    textValue = '00' + value.toString();
  } else if (value < 100) {
    textValue = '0' + value.toString();
  } else {
    textValue = value.toString();
  }

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
                percent: 0.5,
                progressColor: Colors.green,
                backgroundColor: Colors.grey[900],
              )),
        )
      ]));
}
