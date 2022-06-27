import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokeapp/shared/constants/app_colors.dart';

class AppGradients {
  static Map<String, dynamic> factoryGradient(String type) {
    Map<String, Color> colors;
    switch (type) {
      case "Bug":
        colors = AppColors.bugColors;
        break;
      case "Dark":
        colors = AppColors.darkColors;
        break;
      case "Dragon":
        colors = AppColors.dragonColors;
        break;
      case "Electric":
        colors = AppColors.electricColors;
        break;
      case "Fairy":
        colors = AppColors.fairyColors;
        break;
      case "Fighting":
        colors = AppColors.fightingColors;
        break;
      case "Fire":
        colors = AppColors.fireColors;
        break;
      case "Flying":
        colors = AppColors.flyingColors;
        break;
      case "Ghost":
        colors = AppColors.ghostColors;
        break;
      case "Grass":
        colors = AppColors.grassColors;
        break;
      case "Ground":
        colors = AppColors.groundColors;
        break;
      case "Ice":
        colors = AppColors.iceColors;
        break;
      case "Poison":
        colors = AppColors.poisonColors;
        break;
      case "Psychic":
        colors = AppColors.psychicColors;
        break;
      case "Rock":
        colors = AppColors.rockColors;
        break;
      case "Steel":
        colors = AppColors.steelColors;
        break;
      case "Water":
        colors = AppColors.waterColors;
        break;
      default:
        colors = AppColors.normalColors;
        break;
    }
    return {
      "colors": colors,
      "gradient": LinearGradient(
        colors: <Color>[
          colors["top"]!,
          colors["bottom"]!,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )
    };
  }
}
