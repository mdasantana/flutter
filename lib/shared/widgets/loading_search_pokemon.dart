import 'package:flutter/material.dart';
import 'package:pokeapp/shared/shared.dart';

class LoadingSearchPokemon extends StatelessWidget {
  const LoadingSearchPokemon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Colors.white70,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            AppStrings.loadingText,
            style: AppTextStyles.white12w700Roboto,
          ),
        ],
      ),
    );
  }
}
