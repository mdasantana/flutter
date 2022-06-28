import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokeapp/data/pokemon.dart';

class HttpHelper {
  Future<Pokemon> getPokemonById(int pokemonId) async {
    Uri uri = Uri.parse("https://pokeapi.glitch.me/v1/pokemon/$pokemonId");
    var result = await http.get(uri);
    List<dynamic> pokemonList = jsonDecode(result.body);
    Map<String, dynamic> pokemonData = pokemonList.first;
    debugPrint(pokemonData.toString());
    Pokemon pokemon = Pokemon.fromJson(pokemonData);
    return pokemon;
  }

  Future<Pokemon> getPokemonByName(String pokemonName) async {
    Uri uri = Uri.parse("https://pokeapi.glitch.me/v1/pokemon/$pokemonName");
    var result = await http.get(uri);
    List<dynamic> pokemonList = jsonDecode(result.body);
    Map<String, dynamic> pokemonData = pokemonList.first;
    debugPrint(pokemonData.toString());
    Pokemon pokemon = Pokemon.fromJson(pokemonData);
    return pokemon;
  }
}
