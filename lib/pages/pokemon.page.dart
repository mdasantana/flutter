import 'package:flutter/material.dart';
import 'package:pokeapp/data/pokemon.dart';
import '../data/http_helper.dart';
import '../shared/shared.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  HttpHelper httpHelper = HttpHelper();
  int pokemonNumber = 1;
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
  late Pokemon nextPokemon;
  Map<String, Pokemon> previousPokemons = {};
  bool inLoadingEvolutionLine = true;
  bool inLoading = true;
  bool inLoadingPreviousNext = false;

  void onPressedToPrevious() {
    inLoadingPreviousNext = true;
    setState(() {});
    int previousId = int.parse(pokemon.number) - 1;
    if (!previousPokemons.containsKey(previousId)) {
      httpHelper.getPokemonById(id: previousId).then((value) {
        previousPokemons.addEntries({
          MapEntry(
            pokemon.number,
            pokemon,
          ),
        });
        pokemon = value;
        getEvolutionLine(pokemon);
        inLoadingPreviousNext = false;
        setState(() {});
      });
    } else {
      pokemon = previousPokemons[previousId.toString()]!;
      getEvolutionLine(pokemon);
      inLoadingPreviousNext = false;
      setState(() {});
    }
  }

  void onPressedToNext() {
    inLoadingPreviousNext = true;
    setState(() {});
    int nextPokemonId = int.parse(pokemon.number) + 1;
    try {
      nextPokemon = evolutionLine.firstWhere(
        (element) => int.parse(element.number) == nextPokemonId,
      );
      previousPokemons.addEntries({
        MapEntry(
          pokemon.number,
          pokemon,
        ),
      });
      pokemon = nextPokemon;
      getEvolutionLine(pokemon);
      inLoadingPreviousNext = false;
      setState(() {});
    } catch (e) {
      httpHelper.getPokemonById(id: nextPokemonId).then((value) {
        previousPokemons.addEntries({
          MapEntry(
            pokemon.number,
            pokemon,
          ),
        });
        pokemon = value;
        getEvolutionLine(pokemon);
        inLoadingPreviousNext = false;
        setState(() {});
      });
    }
  }

  void getPokemon() {
    httpHelper.getPokemonById().then((value) {
      pokemon = value;
      inLoading = false;
      setState(() {});
      getEvolutionLine(pokemon);
    });
  }

  void getEvolutionLine(Pokemon pokemon) {
    List evolution = pokemon.family["evolutionLine"];
    evolutionLine.clear();
    for (var element in evolution) {
      //Caso ocorra na evolutionLine o retorno de uma string com multiplos nomes,
      //como ocorre no pokemon 133/Eevee
      if (element.contains("/")) {
        element = element.split("/")[0];
      }
      httpHelper.getPokemonByName(element).then((value) {
        evolutionLine.add(value);
        inLoadingEvolutionLine = false;
        evolutionLine.sort(
          (a, b) => a.number.compareTo(b.number),
        );
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: inLoading
          ? const LoadingSearchPokemon()
          : SafeArea(
              child: Stack(
                children: [
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CoverDetailsPokemon(
                          pokemon: pokemon,
                          onPressedPrevious: int.parse(pokemon.number) == 1
                              ? null
                              : onPressedToPrevious,
                          onPressedNext: int.parse(pokemon.number) == 807
                              ? null
                              : onPressedToNext,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: DetailsPokemon(
                          pokemon: pokemon,
                          inLoadingEvolutionLine: inLoadingEvolutionLine,
                          evolutionLine: evolutionLine,
                        ),
                      )
                    ],
                  ),
                  if (inLoadingPreviousNext) const LoadingSearchPokemon(),
                ],
              ),
            ),
    );
  }
}