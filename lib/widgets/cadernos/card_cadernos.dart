import 'package:flutter/material.dart';
import 'package:your_matter/utils/constantes.dart';

class CardCaderno extends StatefulWidget {
  const CardCaderno({super.key});

  @override
  State<CardCaderno> createState() => _CardCadernoState();
}

class _CardCadernoState extends State<CardCaderno> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 40,
      color: Colors.red,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(defaultpd)),
      padding: const EdgeInsets.all(defaultpd / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text('Teste')],
      ),
    );
  }
}
