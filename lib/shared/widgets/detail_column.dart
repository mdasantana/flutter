import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class DetailColumn extends StatelessWidget {
  final String title;
  final Widget child;
  const DetailColumn({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.white16w700Roboto,
        ),
        const SizedBox(
          height: 10,
        ),
        child
      ],
    );
  }
}
