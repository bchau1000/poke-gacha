class Pokemon {
  final String id;
  final String name;

  Pokemon(this.id, this.name);
  Pokemon.fromPokemon({this.id, this.name});

  // Grab file path for sprite
  // sprite formatted as pokemon_id.png
  get art {
    return 'lib/src/assets/artwork/' + this.id.toString() + '.png';
  }

  get nameLabel {
    return this.name[0].toUpperCase() + this.name.substring(1);
  }

  get idLabel {
    if (this.id.length == 2)
      return '0' + this.id;
    else if (this.id.length == 1)
      return '00' + this.id;
    else
      return this.id;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon.fromPokemon(id: json['id'], name: json['pokeName']);
  }
}
