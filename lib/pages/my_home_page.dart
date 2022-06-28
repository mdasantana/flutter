import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokeapp/data/http_helper.dart';
import 'package:pokeapp/data/pokemon.dart';
import 'pokemons/pokemon/pokemon.page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool inLoading = true;
  Pokemon pokemon = Pokemon(
    number: "",
    name: "",
    species: "",
    types: [],
    abilities: {},
    eggGroups: [],
    gender: [],
    height: "",
    weight: "",
    family: {},
    starter: false,
    legendary: false,
    mythical: false,
    ultraBeast: "",
    mega: false,
    gen: 1,
    sprite: "",
    description: "",
  );
  List<Pokemon> evolutionLine = [];

  Future<Pokemon> getPokemonById() async {
    Random random = Random();
    HttpHelper httpHelper = HttpHelper();
    return await httpHelper.getPokemonById((random.nextInt(808)));
  }

  @override
  void initState() {
    getPokemonById().then((value) {
      pokemon = value;
      inLoading = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return inLoading
        ? const Center(child: CircularProgressIndicator())
        : PokemonPage(
            pokemon: pokemon,
          );
  }
}
