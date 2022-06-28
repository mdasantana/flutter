import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokeapp/data/pokemon.dart';

class HttpHelper {
  Future<Pokemon> _getPokemon({int? id, String? name}) async {
    dynamic pokemonId = id ?? name;
    Uri uri = Uri.parse("https://pokeapi.glitch.me/v1/pokemon/$pokemonId");
    var result = await http.get(uri);
    List<dynamic> pokemonList = jsonDecode(result.body);
    Map<String, dynamic> pokemonData = pokemonList.first;
    Pokemon pokemon = Pokemon.fromJson(pokemonData);
    return pokemon;
  }

  // Future<Pokemon> _getPokemonByName(String pokemonName) async {
  //   Uri uri = Uri.parse("https://pokeapi.glitch.me/v1/pokemon/$pokemonName");
  //   var result = await http.get(uri);
  //   List<dynamic> pokemonList = jsonDecode(result.body);
  //   Map<String, dynamic> pokemonData = pokemonList.first;
  //   Pokemon pokemon = Pokemon.fromJson(pokemonData);
  //   return pokemon;
  // }

  Future<Pokemon> getPokemonById({int? id}) async {
    Random random = Random();
    int pokemonId = id ?? random.nextInt(807);
    return await _getPokemon(id: pokemonId);
  }

  Future<Pokemon> getPokemonByName(String name) async {
    return await _getPokemon(name: name);
  }
}
