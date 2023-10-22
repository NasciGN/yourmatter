import 'package:flutter/material.dart';
import 'package:your_matter/utils/constantes.dart';

class CardCaderno extends StatelessWidget {
  final String title;

  CardCaderno({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultpd),
        color: Colors.red,
      ),
      padding: const EdgeInsets.all(defaultpd / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text(title)],
      ),
    );
  }
}
