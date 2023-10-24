import 'package:flutter/material.dart';
import 'package:your_matter/utils/constantes.dart';

class CardCaderno extends StatelessWidget {
  final String title;

  CardCaderno({required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 5,
            width: 165,
            height: 230,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.amber,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            )),
        // Arames
        Positioned(
          left: 0,
          top: 15,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 30,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 45,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 60,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 75,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 90,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 105,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 120,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 135,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 150,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 165,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 180,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 195,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 210,
          width: 14,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 10,
          height: 30,
          width: 165,
          child: Text(
            'teste',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Sansation',
                fontSize: 25,
                color: Colors.white),
          ),
        )
      ],
    );
  }
}
