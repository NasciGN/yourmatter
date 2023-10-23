import 'package:flutter/material.dart';

import '../utils/constantes.dart';
import 'forms/login_form.dart';

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
      backgroundColor: bgColor2,
      body: SingleChildScrollView(
        reverse: true,
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.only(top: defaultpd * 2),
            width: double.infinity,
            child: const Column(
              children: [
                SizedBox(
                  height: defaultpd * 3,
                ),
                Text(
                  "Bem vindo ao",
                  style: TextStyle(
                      fontFamily: 'Sansation',
                      color: Color.fromRGBO(26, 76, 97, 1),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      fontSize: 30),
                ),
                Text(
                  "YourMatter",
                  style: TextStyle(
                      fontFamily: 'Bridht Melody',
                      color: Color.fromRGBO(26, 76, 97, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: defaultpd * 2,
              left: defaultpd * 2,
              top: defaultpd * 2,
            ),
            margin: EdgeInsets.only(top: size.height * 0.3),
            height: size.height * 0.7,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultpd * 4),
                )),
            child: const LoginForm(),
          ),
        ]),
      ),
    );
  }
}
