import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatTab extends StatelessWidget {
  final Map stats;
  StatTab({Key key, @required this.stats}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(child: pokemonStatBars());
  }

  Widget pokemonStatBars() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          statBar('HP', stats['hp'], Colors.red[400]),
          statBar('ATK', stats['attack'], Colors.orange[400]),
          statBar('DEF', stats['defense'], Colors.yellow[300]),
          statBar('SPD', stats['speed'], Colors.green[300]),
          statBar('SATK', stats['special-attack'], Colors.purple[300]),
          statBar('SDEF', stats['special-defense'], Colors.blue[300]),
        ],
      ),
    );
  }

  Widget statBar(String stat, int value, Color color) {
    String textValue = '';
    if (value < 10)
      textValue = '00' + value.toString();
    else if (value < 100)
      textValue = '0' + value.toString();
    else
      textValue = value.toString();

    double percent = value / 255;

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              height: 25,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  stat,
                  style: GoogleFonts.openSans(
                      fontSize: 15, color: Colors.grey[400]),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 25,
              child: Center(
                child: Text(
                  textValue,
                  style: GoogleFonts.openSans(
                      fontSize: 15, color: Colors.grey[400]),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              height: 25,
              child: LinearPercentIndicator(
                lineHeight: 12.0,
                percent: percent,
                progressColor: color,
                backgroundColor: Colors.grey[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
