import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class NumberCircle extends StatelessWidget {
  final Color color;
  final String number;
  const NumberCircle({
    Key? key,
    required this.color,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF000000).withOpacity(0.25),
            blurRadius: 5.0,
            offset: const Offset(5, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "#",
            style: AppTextStyles.white10w700Roboto,
          ),
          Text(
            number,
            style: AppTextStyles.white14w700Roboto,
          )
        ],
      ),
    );
  }
}
