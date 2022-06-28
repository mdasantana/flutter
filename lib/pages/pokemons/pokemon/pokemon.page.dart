import 'package:flutter/material.dart';
import 'package:pokeapp/data/pokemon.dart';
import '../../../data/http_helper.dart';
import '../../../shared/shared.dart';

class PokemonPage extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  List<Pokemon> evolutionLine = [];
  bool isLoadingEvolutionLine = true;
  Future<Pokemon> getPokemonByName(String name) async {
    HttpHelper httpHelper = HttpHelper();
    return await httpHelper.getPokemonByName(name);
  }

  @override
  void initState() {
    List evolution = widget.pokemon.family["evolutionLine"];
    for (var element in evolution) {
      getPokemonByName(element).then((value) {
        evolutionLine.add(value);
        isLoadingEvolutionLine = false;
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: AppGradients.factoryGradient(
                    widget.pokemon.types.first)["colors"]["bottom"],
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.network(
                          widget.pokemon.sprite,
                          fit: BoxFit.contain,
                          loadingBuilder: loadingBuilderImage,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SearchPokemonTextInput(
                        width: MediaQuery.of(context).size.width * .9,
                        height: 40,
                        onPressed: () {},
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
                              widget.pokemon.types.first)["colors"]["top"],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          widget.pokemon.name.toUpperCase(),
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
                    widget.pokemon.types.first)["colors"]["top"],
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            widget.pokemon.types.length,
                            (index) => TypeButton(
                              type: widget.pokemon.types[index],
                              color: AppGradients.factoryGradient(
                                      widget.pokemon.types[index])["colors"]
                                  ["bottom"],
                            ),
                          ),
                        ),
                        CharacteristicPokemon(
                          title: "DESCRIPTION",
                          child: Text(
                            widget.pokemon.description,
                            style: AppTextStyles.white12w700Roboto,
                          ),
                        ),
                        CharacteristicPokemon(
                          title: "SIZES",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DetailColumn(
                                title: "HEIGHT",
                                child: Text(
                                  widget.pokemon.height,
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
                                      widget.pokemon.weight
                                          .replaceAll("lbs.", ""),
                                      style: AppTextStyles.white32w700Roboto,
                                    ),
                                    const Text(
                                      "lbs.",
                                      style: AppTextStyles.white16w700Roboto,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DetailColumn(
                                title: "NORMAL",
                                child: Text(
                                  widget.pokemon.abilities["normal"].isEmpty
                                      ? "-"
                                      : widget
                                          .pokemon.abilities["normal"].first,
                                  style: AppTextStyles.white24w700Roboto,
                                ),
                              ),
                              DetailColumn(
                                title: "HIDDEN",
                                child: Text(
                                  widget.pokemon.abilities["hidden"].isEmpty
                                      ? "-"
                                      : widget
                                          .pokemon.abilities["hidden"].first,
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
                            child: isLoadingEvolutionLine
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: AppGradients.factoryGradient(widget
                                          .pokemon
                                          .types
                                          .first)["colors"]["bottom"],
                                    ),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: evolutionLine.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
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
