import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTab extends StatelessWidget {
  final String height;
  final String weight;
  final String rarity;
  final String desc;

  AboutTab({
    Key key,
    @required this.height,
    @required this.weight,
    @required this.rarity,
    @required this.desc,
  });

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 6,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Text(
                desc,
                style: GoogleFonts.openSans(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: pokemonPhysStats(),
          ),
        ],
      ),
    );
  }

  Widget pokemonPhysStats() {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.grey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          statContainer(rarity, 'Rarity'),
          statContainer(height + ' m', 'Height'),
          statContainer(weight + ' kg', 'Weight'),
        ],
      ),
    );
  }

  Widget statContainer(String value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            child: Text(
              label,
              style: GoogleFonts.openSans(
                color: Colors.grey[400],
                fontSize: 15,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              value,
              style: GoogleFonts.openSans(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
