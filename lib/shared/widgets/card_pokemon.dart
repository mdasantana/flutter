import 'package:flutter/material.dart';
import 'package:pokeapp/data/pokemon.dart';
import '../constants/app_gradients.dart';
import '../constants/app_text_styles.dart';
import 'loading_builder_image.dart';
import 'number_circle.dart';

class CardPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const CardPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            gradient:
                AppGradients.factoryGradient(pokemon.types.first)["gradient"],
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Image.network(
                  pokemon.sprite,
                  fit: BoxFit.cover,
                  loadingBuilder: loadingBuilderImage,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  pokemon.name,
                  style: AppTextStyles.white16w700Roboto,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: NumberCircle(
              color: AppGradients.factoryGradient(pokemon.types.first)["colors"]
                  ["bottom"],
              number: pokemon.number),
        ),
      ],
    );
  }
}
