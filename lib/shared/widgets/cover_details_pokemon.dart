import 'package:flutter/material.dart';

import '../../data/pokemon.dart';
import '../shared.dart';

class CoverDetailsPokemon extends StatelessWidget {
  final Pokemon pokemon;
  final OnPressedPreviousNext? onPressedPrevious;
  final OnPressedPreviousNext? onPressedNext;
  const CoverDetailsPokemon({
    Key? key,
    required this.pokemon,
    required this.onPressedPrevious,
    required this.onPressedNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppGradients.factoryGradient(pokemon.types.first)["colors"]
          ["bottom"],
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
            child: PreviousAndNextButton(
              color: AppGradients.factoryGradient(pokemon.types[0])["colors"]
                  ["top"],
              margin: const EdgeInsets.only(
                left: 8.0,
              ),
              icon: Icons.arrow_back_ios_new_rounded,
              onPressed: onPressedPrevious,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: PreviousAndNextButton(
                color: AppGradients.factoryGradient(pokemon.types[0])["colors"]
                    ["top"],
                margin: const EdgeInsets.only(
                  right: 8.0,
                ),
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: onPressedNext),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .8,
              height: 45,
              decoration: BoxDecoration(
                color:
                    AppGradients.factoryGradient(pokemon.types.first)["colors"]
                        ["top"],
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
    );
  }
}
