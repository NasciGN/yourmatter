import 'package:flutter/material.dart';
import 'package:your_matter/utils/constantes.dart';

class CardCaderno extends StatelessWidget {
  final String title;

  CardCaderno({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultpd),
        color: const Color.fromARGB(255, 213, 137, 226),
      ),
      padding: const EdgeInsets.all(defaultpd / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5),
          )
        ],
      ),
    );
  }
}
