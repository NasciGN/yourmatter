import 'package:flutter/material.dart';
import 'package:your_matter/src/models/page.dart';
import 'package:your_matter/src/utils/constantes.dart';

class CardCaderno extends StatelessWidget {
  final myPage note;

  CardCaderno({required this.note});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 5,
          width: 160,
          height: 220,
          child: Container(
            padding: EdgeInsets.only(
                top: defaultpd * 2, left: defaultpd, right: defaultpd),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 8,
                  color: Color.fromARGB(255, note.borderColor[0],
                      note.borderColor[1], note.borderColor[2])),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultpd),
                  bottomLeft: Radius.circular(defaultpd),
                  topRight: Radius.circular(defaultpd),
                  bottomRight: Radius.circular(defaultpd)),
              color: Color.fromARGB(
                  255, note.bgColor[0], note.bgColor[1], note.bgColor[2]),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                note.title,
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
              color: Color.fromARGB(255, note.borderColor[0],
                  note.borderColor[1], note.borderColor[2]),
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
              color: Color.fromARGB(255, note.borderColor[0],
                  note.borderColor[1], note.borderColor[2]),
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
              color: Color.fromARGB(255, note.borderColor[0],
                  note.borderColor[1], note.borderColor[2]),
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
              color: Color.fromARGB(255, note.borderColor[0],
                  note.borderColor[1], note.borderColor[2]),
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
              color: Color.fromARGB(255, note.borderColor[0],
                  note.borderColor[1], note.borderColor[2]),
            ),
          ),
        ),
      ],
    );
  }
}
