import 'package:flutter/material.dart';
import 'package:your_matter/models/page.dart';
import 'package:your_matter/utils/constantes.dart';

import '../../views/functions/create_Page.dart';

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
        color: Colors.purple,
      ),
      padding: const EdgeInsets.all(defaultpd / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5),)],
      ),
    );
  }
}
