import 'package:flutter/material.dart';
import 'package:pokeapp/shared/constants/app_text_styles.dart';
import '../../../shared/widgets/card_pokemon.dart';
import '../../../shared/widgets/loading_builder_image.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      height: double.infinity,
                      color: const Color(0XFF6AF429).withOpacity(.8),
                      child: Image.network(
                        "https://cdn.traction.one/pokedex/pokemon/1.png",
                        fit: BoxFit.contain,
                        loadingBuilder: loadingBuilderImage,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 40,
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
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xFFCC2936),
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
                  ),
                  // Positioned(
                  //   top: 16,
                  //   left: 16,
                  //   child: GestureDetector(
                  //     onTap: () => Navigator.pop(context),
                  //     child: Container(
                  //       height: 42,
                  //       width: 42,
                  //       decoration: BoxDecoration(
                  //         color: const Color(0xFF1F4952),
                  //         shape: BoxShape.circle,
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: const Color(0XFF000000).withOpacity(0.25),
                  //             blurRadius: 5.0,
                  //             offset: const Offset(5, 3),
                  //           )
                  //         ],
                  //       ),
                  //       child: const Icon(
                  //         Icons.arrow_back_outlined,
                  //         size: 32,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .8,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1F4952),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Text(
                        "Bulbasaur".toUpperCase(),
                        style: AppTextStyles.white32w700Roboto,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xFF1F4952),
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
                          children: [
                            Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF6AF429),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  "Grass",
                                  style: AppTextStyles.white24w700Roboto,
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFB141A6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  "Poison",
                                  style: AppTextStyles.white24w700Roboto,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: const [
                            Text(
                              "DESCRIPTION",
                              style: AppTextStyles.white16w700Roboto,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "While it is young, it uses the nutrients that are stored in the seeds on its back in order to grow.",
                              style: AppTextStyles.white14w700Roboto,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "HEIGHT",
                                  style: AppTextStyles.white16w700Roboto,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "2'04",
                                  style: AppTextStyles.white32w700Roboto,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "WEIGHT",
                                  style: AppTextStyles.white16w700Roboto,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: const [
                                    Text(
                                      "15.2",
                                      style: AppTextStyles.white32w700Roboto,
                                    ),
                                    Text(
                                      "lbs.",
                                      style: AppTextStyles.white16w700Roboto,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            const Text(
                              "ABILITIES",
                              style: AppTextStyles.white16w700Roboto,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: const [
                                    Text(
                                      "NORMAL",
                                      style: AppTextStyles.white14w700Roboto,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Overgrow",
                                      style: AppTextStyles.white24w700Roboto,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      "HIDDEN",
                                      style: AppTextStyles.white14w700Roboto,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Chlorophyll",
                                      style: AppTextStyles.white24w700Roboto,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            const Text(
                              "EVOLUTION LINE",
                              style: AppTextStyles.white16w700Roboto,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: CardPokemon(),
                                ),
                              ),
                            ),
                          ],
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
