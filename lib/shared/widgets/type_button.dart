import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class TypeButton extends StatelessWidget {
  final String type;
  final Color color;
  const TypeButton({
    Key? key,
    required this.type,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          type,
          style: AppTextStyles.white24w700Roboto,
        ),
      ),
    );
  }
}
