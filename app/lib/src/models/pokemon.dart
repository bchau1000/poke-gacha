class Pokemon {
  final String id;
  final String name;
  String height;
  String weight;
  String rarity;
  String desc;

  Pokemon(this.id, this.name);
  Pokemon.partial({this.id, this.name, this.height, this.weight, this.rarity});
  Pokemon.full(
      {this.id, this.name, this.height, this.weight, this.rarity, this.desc});
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

  get heightLabel {
    return this.height + " m";
  }

  get weightLabel {
    return this.weight + " kg";
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon.full(
        id: json['id'],
        name: json['pokeName'],
        height: json['height'],
        weight: json['weight'],
        rarity: json['rarity'],
        desc: json['desc']);
  }
}
