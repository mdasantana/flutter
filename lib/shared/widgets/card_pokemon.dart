import 'package:flutter/material.dart';
import '../constants/app_gradients.dart';
import '../constants/app_text_styles.dart';
import 'loading_builder_image.dart';
import 'number_circle.dart';

class CardPokemon extends StatelessWidget {
  const CardPokemon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "pokemon"),
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              gradient: AppGradients.factoryGradient("Grass")["gradient"],
              borderRadius: const BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.network(
                    "https://cdn.traction.one/pokedex/pokemon/1.png",
                    fit: BoxFit.cover,
                    loadingBuilder: loadingBuilderImage,
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Bulbasaur",
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
                color: AppGradients.factoryGradient("Grass")["colors"]
                    ["bottom"],
                number: "1"),
          ),
        ],
      ),
    );
  }
}
