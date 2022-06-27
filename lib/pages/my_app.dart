import 'package:flutter/material.dart';
import 'package:pokeapp/pages/pokemons/pokemon/pokemon.page.dart';
import 'package:pokeapp/pages/pokemons/pokemon/pokemons.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeApp',
      initialRoute: "pokemon",
      debugShowCheckedModeBanner: false,
      routes: {
        "allpokemons": (context) => const PokemonsPage(),
        "pokemon": (context) => const PokemonPage()
      },
    );
  }
}