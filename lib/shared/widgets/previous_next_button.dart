import 'package:flutter/material.dart';

typedef OnPressedPreviousNext = void Function();

class PreviousAndNextButton extends StatelessWidget {
  final Color color;
  final EdgeInsetsGeometry margin;
  final OnPressedPreviousNext? onPressed;
  final IconData icon;
  const PreviousAndNextButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.margin,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
        ),
      ),
    );
  }
}
