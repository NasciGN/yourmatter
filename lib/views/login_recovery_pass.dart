import 'package:flutter/material.dart';
import 'package:your_matter/utils/constantes.dart';

class RecoveryPassPage extends StatefulWidget {
  const RecoveryPassPage({super.key});

  @override
  State<RecoveryPassPage> createState() => _RecoveryPassPageState();
}

class _RecoveryPassPageState extends State<RecoveryPassPage> {
  TextEditingController _controllerEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerEmail.dispose();
  }

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
                  "Recuperar senha",
                  style: TextStyle(
                      color: bgColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: defaultpd * 3,
              left: defaultpd * 3,
              top: defaultpd * 3,
            ),
            margin: EdgeInsets.only(top: size.height * 0.3),
            height: size.height * 0.7,
            decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultpd * 4),
                )),
            child: Form(
              key: _formKey,
              child: const Column(children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: defaultpd, bottom: defaultpd * 2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Esqueceu sua senha?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Sem problemas, coloque seu email abaixo que enviaremos um email de recuperação para você.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: defaultpd),
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
