class Pokemon {
  late String number;
  late String name;
  late String species;
  late List<dynamic> types;
  late Map<String, dynamic> abilities;
  late List<dynamic> eggGroups;
  late List<dynamic> gender;
  late String height;
  late String weight;
  late Map<String, dynamic> family;
  late bool starter;
  late bool legendary;
  late bool mythical;
  late dynamic ultraBeast;
  late bool mega;
  late int gen;
  late String sprite;
  late String description;

  Pokemon({
    required this.number,
    required this.name,
    required this.species,
    required this.types,
    required this.abilities,
    required this.eggGroups,
    required this.gender,
    required this.height,
    required this.weight,
    required this.family,
    required this.starter,
    required this.legendary,
    required this.mythical,
    required this.ultraBeast,
    required this.mega,
    required this.gen,
    required this.sprite,
    required this.description,
  });

  Pokemon.fromJson(Map<String, dynamic> pokemonMap) {
    number = pokemonMap["number"];
    name = pokemonMap["name"];
    species = pokemonMap["species"];
    types = pokemonMap["types"];
    abilities = pokemonMap["abilities"];
    eggGroups = pokemonMap["eggGroups"];
    gender = pokemonMap["gender"];
    height = pokemonMap["height"];
    weight = pokemonMap["weight"];
    family = pokemonMap["family"];
    starter = pokemonMap["starter"];
    legendary = pokemonMap["legendary"];
    mythical = pokemonMap["mythical"];
    ultraBeast = pokemonMap["ultraBeast"];
    mega = pokemonMap["mega"];
    gen = pokemonMap["gen"];
    sprite = pokemonMap["sprite"];
    description = pokemonMap["description"];
  }
}
