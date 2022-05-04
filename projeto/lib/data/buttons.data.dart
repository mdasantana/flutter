import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ButtonsProvider {
  static final ButtonsProvider _instance = ButtonsProvider.internal();
  factory ButtonsProvider() => _instance;
  ButtonsProvider.internal();
  final List<Map<String, dynamic>> _botoes = [
    {
      "value": "C",
      "action": "CLEAR_ALL",
      "isIcon": false,
      "color": Colors.redAccent.withOpacity(.9),
    },
    {
      "value": TablerIcons.arrow_left,
      "action": "CLEAR",
      "isIcon": true,
      "color": Colors.orange.withOpacity(.9),
    },
    {
      "value": TablerIcons.percentage,
      "action": "PERCENT",
      "isIcon": true,
      "color": Colors.orange.withOpacity(.9),
    },
    {
      "value": TablerIcons.divide,
      "action": "DIVIDE",
      "isIcon": true,
      "color": Colors.orange.withOpacity(.9),
    },
    {
      "value": "7",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": "8",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": "9",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": TablerIcons.x,
      "action": "MULTIPLY",
      "isIcon": true,
      "color": Colors.orange.withOpacity(.9),
    },
    {
      "value": "4",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": "5",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": "6",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": TablerIcons.minus,
      "action": "SUBTRACT",
      "isIcon": true,
      "color": Colors.orange.withOpacity(.9),
    },
    {
      "value": "1",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": "2",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": "3",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": TablerIcons.plus,
      "action": "ADD",
      "isIcon": true,
      "color": Colors.orange.withOpacity(.9),
    },
    {
      "value": "+/-",
      "action": "REVERSE_SIGNAL",
      "isIcon": false,
      "color": Colors.orange.withOpacity(.9),
    },
    {
      "value": "0",
      "action": "NONE",
      "isIcon": false,
      "color": Colors.white70,
    },
    {
      "value": ".",
      "action": "DOT",
      "isIcon": false,
      "color": Colors.orange.withOpacity(.9),
    },
    {
      "value": TablerIcons.equal,
      "action": "OPERATE",
      "isIcon": true,
      "color": Colors.orange.withOpacity(.9),
    },
  ];

  get botoes {
    return _botoes;
  }
}
