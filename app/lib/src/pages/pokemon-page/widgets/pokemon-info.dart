import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'info-tabs.dart';
import '../../../models/pokemon-info.dart';

Widget pokemonInfoContainer(
    BuildContext context, Pokemon pokemon, PokemonInfo info) {
  return Flexible(
      flex: 9,
      child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(children: <Widget>[
            tabBar(context, pokemon, info),
          ])));
}

Widget pokemonLabel(String name) {
  return Flexible(
      flex: 2,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Center(
              child: Text(name,
                  style: GoogleFonts.openSans(
                      textStyle:
                          TextStyle(fontSize: 30, color: Colors.white))))));
}

Widget pokemonTypesContainer() {
  return Flexible(
      flex: 1,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(width: 80, color: Colors.red),
              ])));
}

Widget tabBar(BuildContext context, Pokemon pokemon, PokemonInfo info) {
  return Flexible(
      fit: FlexFit.tight,
      flex: 10,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
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
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: new BubbleTabIndicator(
                          indicatorHeight: 40,
                          indicatorColor: Colors.grey[900],
                          tabBarIndicatorSize: TabBarIndicatorSize.tab,
                        ),
                        tabs: [
                          Tab(child: tabLabel('Stats')),
                          Tab(child: tabLabel('Evolutions')),
                          Tab(child: tabLabel('Abilities')),
                        ],
                      ),
                      body: TabBarView(children: <Widget>[
                        pokemonStatsContainer(pokemon, info),
                        Container(
                            color: Colors.grey[850],
                            child: tabLabel('Evolutions')),
                        Container(
                            color: Colors.grey[850],
                            child: tabLabel('Abilities')),
                      ]))))));
}

Widget tabLabel(String label) {
  return Center(
      child: Text(label,
          style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 17))));
}
