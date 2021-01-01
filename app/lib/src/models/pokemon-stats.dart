class PokemonStats {
  final int att;
  final int def;
  final int satk;
  final int hp;
  final int sdef;
  final int spd;

  PokemonStats(this.hp, this.att, this.def, this.spd, this.satk, this.sdef);
  PokemonStats.fromPokemonInfo({
    this.hp,
    this.att,
    this.def,
    this.spd,
    this.satk,
    this.sdef,
  });

  factory PokemonStats.fromDict(Map<String, dynamic> json) {
    return PokemonStats.fromPokemonInfo(
      hp: json['hp'],
      att: json['attack'],
      def: json['defense'],
      satk: json['special-attack'],
      sdef: json['special-defense'],
      spd: json['speed'],
    );
  }
}
