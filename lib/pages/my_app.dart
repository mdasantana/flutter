import 'package:flutter/material.dart';
import 'package:pokeapp/pages/pokemon.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PokeApp',
      home: PokemonPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}