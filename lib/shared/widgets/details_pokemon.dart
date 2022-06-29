import 'package:flutter/material.dart';
import '../../data/pokemon.dart';
import '../shared.dart';

class DetailsPokemon extends StatelessWidget {
  const DetailsPokemon({
    Key? key,
    required this.pokemon,
    required this.inLoadingEvolutionLine,
    required this.evolutionLine,
  }) : super(key: key);

  final Pokemon pokemon;
  final bool inLoadingEvolutionLine;
  final List<Pokemon> evolutionLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppGradients.factoryGradient(pokemon.types.first)["colors"]["top"],
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                  pokemon.types.length,
                  (index) => TypeButton(
                    type: pokemon.types[index],
                    color: AppGradients.factoryGradient(
                        pokemon.types[index])["colors"]["bottom"],
                  ),
                ),
              ),
              CharacteristicPokemon(
                title: AppStrings.detailDescriptionText,
                child: Text(
                  pokemon.description,
                  style: AppTextStyles.white12w700Roboto,
                ),
              ),
              CharacteristicPokemon(
                title: AppStrings.detailSizesText,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DetailColumn(
                      title: AppStrings.detailHeightText,
                      child: Text(
                        pokemon.height,
                        style: AppTextStyles.white32w700Roboto,
                      ),
                    ),
                    DetailColumn(
                      title: AppStrings.detailWeightText,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            pokemon.weight.replaceAll(AppStrings.detailLbsText, ""),
                            style: AppTextStyles.white32w700Roboto,
                          ),
                          Text(
                            AppStrings.detailLbsText,
                            style: AppTextStyles.white16w700Roboto,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CharacteristicPokemon(
                title: AppStrings.detailAbilitiesText,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DetailColumn(
                      title: AppStrings.detailNormalText,
                      child: Text(
                        pokemon.abilities["normal"].isEmpty
                            ? "-"
                            : pokemon.abilities["normal"].first,
                        style: AppTextStyles.white24w700Roboto,
                      ),
                    ),
                    DetailColumn(
                      title: AppStrings.detailHiddenText,
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
                title: AppStrings.detailEvolutionLineText,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 100,
                  child: inLoadingEvolutionLine
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppGradients.factoryGradient(
                                pokemon.types.first)["colors"]["bottom"],
                          ),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: evolutionLine.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
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
    );
  }
}