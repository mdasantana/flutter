import 'package:flutter/material.dart';
import 'package:pokeapp/data/pokemon.dart';
import '../../../data/http_helper.dart';
import '../../../shared/shared.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  HttpHelper httpHelper = HttpHelper();
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
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: AppGradients.factoryGradient(
                          pokemon.types.first)["colors"]["bottom"],
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Image.network(
                                pokemon.sprite,
                                fit: BoxFit.contain,
                                loadingBuilder: loadingBuilderImage,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.black38,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  inLoading = true;
                                  setState(() {});
                                  int previousId =
                                      int.parse(pokemon.number) - 1;
                                  if (!previousPokemons
                                      .containsKey(previousId)) {
                                    int previousPokemonId =
                                        int.parse(pokemon.number) - 1;
                                    httpHelper
                                        .getPokemonById(id: previousPokemonId)
                                        .then((value) {
                                      previousPokemons.addEntries({
                                        MapEntry(
                                          pokemon.number,
                                          pokemon,
                                        ),
                                      });
                                      pokemon = value;
                                      getEvolutionLine(pokemon);
                                      inLoading = false;
                                      setState(() {});
                                    });
                                  } else {
                                    pokemon = previousPokemons[
                                        previousId.toString()]!;
                                    getEvolutionLine(pokemon);
                                    inLoading = false;
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.only(
                                right: 8.0,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.black38,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  inLoading = true;
                                  setState(() {});
                                  int nextPokemonId =
                                      int.parse(pokemon.number) + 1;
                                  try {
                                    nextPokemon = evolutionLine.firstWhere(
                                      (element) =>
                                          int.parse(element.number) ==
                                          nextPokemonId,
                                    );
                                    previousPokemons.addEntries({
                                      MapEntry(
                                        pokemon.number,
                                        pokemon,
                                      ),
                                    });
                                    pokemon = nextPokemon;
                                    getEvolutionLine(pokemon);
                                    inLoading = false;
                                    setState(() {});
                                  } catch (e) {
                                    httpHelper
                                        .getPokemonById(id: nextPokemonId)
                                        .then((value) {
                                      previousPokemons.addEntries({
                                        MapEntry(
                                          pokemon.number,
                                          pokemon,
                                        ),
                                      });
                                      pokemon = value;
                                      getEvolutionLine(pokemon);
                                      inLoading = false;
                                      setState(() {});
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * .8,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppGradients.factoryGradient(
                                    pokemon.types.first)["colors"]["top"],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Text(
                                pokemon.name.toUpperCase(),
                                style: AppTextStyles.white32w700Roboto,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: AppGradients.factoryGradient(
                          pokemon.types.first)["colors"]["top"],
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(
                                  pokemon.types.length,
                                  (index) => TypeButton(
                                    type: pokemon.types[index],
                                    color: AppGradients.factoryGradient(
                                            pokemon.types[index])["colors"]
                                        ["bottom"],
                                  ),
                                ),
                              ),
                              CharacteristicPokemon(
                                title: "DESCRIPTION",
                                child: Text(
                                  pokemon.description,
                                  style: AppTextStyles.white12w700Roboto,
                                ),
                              ),
                              CharacteristicPokemon(
                                title: "SIZES",
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    DetailColumn(
                                      title: "HEIGHT",
                                      child: Text(
                                        pokemon.height,
                                        style: AppTextStyles.white32w700Roboto,
                                      ),
                                    ),
                                    DetailColumn(
                                      title: "WEIGHT",
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            pokemon.weight
                                                .replaceAll("lbs.", ""),
                                            style:
                                                AppTextStyles.white32w700Roboto,
                                          ),
                                          const Text(
                                            "lbs.",
                                            style:
                                                AppTextStyles.white16w700Roboto,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CharacteristicPokemon(
                                title: "ABILITIES",
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    DetailColumn(
                                      title: "NORMAL",
                                      child: Text(
                                        pokemon.abilities["normal"].isEmpty
                                            ? "-"
                                            : pokemon.abilities["normal"].first,
                                        style: AppTextStyles.white24w700Roboto,
                                      ),
                                    ),
                                    DetailColumn(
                                      title: "HIDDEN",
                                      child: Text(
                                        pokemon.abilities["hidden"].isEmpty
                                            ? "-"
                                            : pokemon.abilities["hidden"].first,
                                        style: AppTextStyles.white24w700Roboto,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CharacteristicPokemon(
                                title: "EVOLUTION LINE",
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .9,
                                  height: 100,
                                  child: inLoadingEvolutionLine
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: AppGradients.factoryGradient(
                                                pokemon.types
                                                    .first)["colors"]["bottom"],
                                          ),
                                        )
                                      : ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: evolutionLine.length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: CardPokemon(
                                              pokemon: evolutionLine[index],
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
