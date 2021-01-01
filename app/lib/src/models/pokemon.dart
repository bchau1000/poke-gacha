class Pokemon {
  final String id;
  final String name;
  String height;
  String weight;
  String rarity;
  String desc;
  List<dynamic> types;
  Map<String, dynamic> stats;

  Pokemon(this.id, this.name);
  Pokemon.partial({this.id, this.name});
  Pokemon.full(
      {this.id,
      this.name,
      this.stats,
      this.types,
      this.height,
      this.weight,
      this.rarity,
      this.desc});

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

  get formattedDesc {
    String formattedDesc = this.desc.replaceAll(new RegExp('\n'), ' ');

    String result = '';
    int length = formattedDesc.length;

    int pos = 0;
    int numPeriods = 0;

    while (pos < length) {
      if (formattedDesc[pos] == '.') {
        numPeriods++;
        if (numPeriods == 3) {
          result += formattedDesc[pos];
          break;
        }
      }

      if (pos + 1 < length) {
        if (formattedDesc[pos] == '.' && formattedDesc[pos + 1] != ' ')
          result += formattedDesc[pos] + ' ';
        else
          result += formattedDesc[pos];
      }

      pos++;
    }

    return result;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon.full(
        id: json['id'],
        name: json['name'],
        types: json['types'],
        stats: json['stats'],
        height: json['height'],
        weight: json['weight'],
        rarity: json['rarity'],
        desc: json['desc']);
  }
}
