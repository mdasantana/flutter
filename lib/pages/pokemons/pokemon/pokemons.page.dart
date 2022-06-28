import 'package:flutter/material.dart';
import 'package:pokeapp/shared/constants/app_text_styles.dart';
import 'package:pokeapp/shared/widgets/card_pokemon.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFCC2936),
        toolbarHeight: MediaQuery.of(context).size.height * .15,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Pokémons",
              style: AppTextStyles.white24w700Roboto,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextField(
                  style: AppTextStyles.lightRed18w700Roboto,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFFCC2936).withOpacity(0.25),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Color(0xFFCC2936),
                      ),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search any Pokémon',
                    hintStyle: AppTextStyles.lightRed18w700Roboto,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Expanded(
            //   flex: 10,
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 10,
            //     crossAxisSpacing: 10,
            //     children: List.generate(
            //       15,
            //       (index) => CardPokemon(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
