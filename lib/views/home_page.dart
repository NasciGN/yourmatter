import 'package:flutter/material.dart';
import 'package:your_matter/utils/constantes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Olá, **',
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: bgColor,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/account');
                },
              )
            ],
          ))
    ])));
  }
}
