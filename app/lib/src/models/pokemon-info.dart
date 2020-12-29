class PokemonInfo {
  final int att;
  final int def;
  final int satk;
  final int hp;
  final int sdef;
  final int spd;

  final List<dynamic> types;

  PokemonInfo(
      this.hp, this.att, this.def, this.spd, this.satk, this.sdef, this.types);
  PokemonInfo.fromPokemonInfo(
      {this.hp,
      this.att,
      this.def,
      this.spd,
      this.satk,
      this.sdef,
      this.types});

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    return PokemonInfo.fromPokemonInfo(
        hp: json['hp'],
        att: json['attack'],
        def: json['defense'],
        satk: json['special-attack'],
        sdef: json['special-defense'],
        spd: json['speed'],
        types: json['types']);
  }
}
