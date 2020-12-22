class Pokemon {
  int id;
  String name;

  // Parameterized constructor
  Pokemon(String name, int id) {
    this.id = id;
    this.name = name;
  }

  // Grab file path for sprite
  // sprite formatted as pokemon_id.png
  get sprite {
    return 'lib/src/assets/sprites/' + this.id.toString() + '.png';
  }
}
