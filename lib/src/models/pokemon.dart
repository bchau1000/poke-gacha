class Pokemon {
  final int id;
  final String name;

  Pokemon(this.id, this.name);
  // Grab file path for sprite
  // sprite formatted as pokemon_id.png
  get sprite {
    return 'lib/src/assets/sprites/' + this.id.toString() + '.png';
  }

  get art {
    return 'lib/src/assets/artwork/' + this.id.toString() + '.png';
  }
}
