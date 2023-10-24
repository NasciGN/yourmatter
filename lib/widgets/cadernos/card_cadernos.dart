import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_matter/utils/constantes.dart';

class CardCaderno extends StatelessWidget {
  final String title;

  CardCaderno({required this.title});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomColorIndex = random.nextInt(colorsBook.length);
    final selectedColors = colorsBook[randomColorIndex];
    return Stack(
      children: [
        Positioned(
          left: 5,
          width: 200,
          height: 260,
          child: Container(
            padding: EdgeInsets.only(
                top: defaultpd * 2, left: defaultpd, right: defaultpd),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 8,
                  color: selectedColors["borderColor"] ?? Colors.black38),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultpd),
                  bottomLeft: Radius.circular(defaultpd),
                  topRight: Radius.circular(defaultpd * 2),
                  bottomRight: Radius.circular(defaultpd * 2)),
              color: selectedColors["bgColor"],
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        // Arames
        Positioned(
          left: 0,
          top: 20,
          width: 25,
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: selectedColors["borderColor"] ?? Colors.black38,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 60,
          width: 25,
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: selectedColors["borderColor"] ?? Colors.black38,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 100,
          width: 25,
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: selectedColors["borderColor"] ?? Colors.black38,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 140,
          width: 25,
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: selectedColors["borderColor"] ?? Colors.black38,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 180,
          width: 25,
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: selectedColors["borderColor"] ?? Colors.black38,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 220,
          width: 25,
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: selectedColors["borderColor"] ?? Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
