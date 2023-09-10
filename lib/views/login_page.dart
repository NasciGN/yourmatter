import 'package:flutter/material.dart';

import '../utils/constantes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.only(top: defaultpd * 2),
            width: double.infinity,
            child: const Column(
              children: [
                SizedBox(
                  height: defaultpd * 2,
                ),
                Text(
                  "Bem vindo ao",
                  style: TextStyle(
                      color: bgColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      fontSize: 30),
                ),
                Text(
                  "YourMatter",
                  style: TextStyle(
                      color: bgColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                right: defaultpd * 3,
                left: defaultpd * 3,
                top: defaultpd * 3,
                bottom: defaultpd),
            margin: EdgeInsets.only(top: size.height * 0.3),
            height: size.height * 0.7,
            decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultpd * 4),
                )),
          ),
        ]),
      ),
    );
  }
}
