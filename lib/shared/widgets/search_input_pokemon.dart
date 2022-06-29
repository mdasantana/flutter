import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

typedef OnPressedInput = Function();

class SearchPokemonTextInput extends StatelessWidget {
  final double width;
  final double height;
  final OnPressedInput onPressed;

  const SearchPokemonTextInput(
      {Key? key,
      required this.width,
      required this.height,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFCC2936),
        ),
      ),
      child: Center(
        child: TextField(
          style: AppTextStyles.lightRed18w700Roboto,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: Color(0xFFCC2936),
              ),
              onPressed: onPressed,
            ),
            hintText: 'Search any Pokémon',
            hintStyle: AppTextStyles.lightRed18w700Roboto,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
