import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/pokemon.dart';

Widget pokemonImageContainer(BuildContext context, Pokemon pokemon) {
  return new Container(
      width: 250,
      height: 250,
      decoration: new BoxDecoration(
          image: DecorationImage(
              image: AssetImage(pokemon.art), fit: BoxFit.fill)));
}
