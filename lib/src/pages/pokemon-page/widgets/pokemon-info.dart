import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';

Widget pokemonInfoContainer(BuildContext context, Pokemon pokemon) {
  return Flexible(
      flex: 4,
      child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(children: <Widget>[
            pokemonLabel(pokemon),
            tabBar(context),
          ])));
}

Widget pokemonLabel(Pokemon pokemon) {
  return Flexible(
      flex: 3,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Center(
              child: Text(pokemon.name,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))))));
}

Widget tabBar(BuildContext context) {
  return Flexible(
      flex: 14,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
          ),
          child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                      backgroundColor: Colors.grey[850],
                      appBar: TabBar(
                        indicatorColor: Colors.red,
                        tabs: [
                          Tab(child: tabLabel('About')),
                          Tab(child: tabLabel('Stats')),
                          Tab(child: tabLabel('Evolution')),
                        ],
                      ),
                      body: TabBarView(children: <Widget>[
                        Container(
                            color: Colors.grey[850], child: tabLabel('About')),
                        Container(
                            color: Colors.grey[850], child: tabLabel('Stats')),
                        Container(
                            color: Colors.grey[850],
                            child: tabLabel('Evolution')),
                      ]))))));
}

Widget tabLabel(String label) {
  return Center(
      child: Text(label,
          style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 19))));
}
