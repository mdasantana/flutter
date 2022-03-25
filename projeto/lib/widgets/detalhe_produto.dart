import 'package:flutter/material.dart';

class Detalhe extends StatelessWidget {
  const Detalhe({
    required this.titulo,
    required this.valor,
    Key? key,
  }) : super(key: key);

  final String titulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
        ),
        SizedBox(height: 4.0),
        Text(
          valor,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
