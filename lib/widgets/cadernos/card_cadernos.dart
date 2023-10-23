import 'package:flutter/material.dart';
import 'package:your_matter/utils/constantes.dart';

class CardCaderno extends StatelessWidget {
  final String title;

  CardCaderno({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultpd),
        color: Color.fromARGB(255, 150, 101, 158),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: defaultpd, horizontal: defaultpd),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5),
          )
        ],
      ),
    );
  }
}
