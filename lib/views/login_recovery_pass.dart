import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:your_matter/resources/auth.dart';
import 'package:your_matter/utils/constantes.dart';

class RecoveryPassPage extends StatefulWidget {
  const RecoveryPassPage({super.key});

  @override
  State<RecoveryPassPage> createState() => _RecoveryPassPageState();
}

class _RecoveryPassPageState extends State<RecoveryPassPage> {
  TextEditingController _controllerEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed('/login');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: bgColor2,
      body: SingleChildScrollView(
        reverse: true,
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.only(top: defaultpd * 2),
            width: double.infinity,
            child: const Column(
              children: [
                Image(
                  image: AssetImage('assets/images/recovery_pass.png'),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: defaultpd * 2,
              left: defaultpd * 2,
              top: defaultpd * 3,
            ),
            margin: EdgeInsets.only(top: size.height * 0.3),
            height: size.height * 0.60,
            decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultpd * 4),
                )),
            child: Form(
              key: _formKey,
              child: Column(children: [
                const Padding(
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
                const Text(
                  'Sem problemas, coloque seu email abaixo que enviaremos um email de recuperação para você.',
                  style: TextStyle(color: Colors.white, fontSize: defaultpd),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _controllerEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Digite seu e-mail',
                    labelStyle:
                        const TextStyle(color: Colors.white), // Cor do rótulo
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(defaultpd),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color:
                              Colors.white), // Cor da borda quando selecionado
                      borderRadius: BorderRadius.circular(defaultpd),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white), // Cor do texto
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Esse campo é obrigatório!'),
                    EmailValidator(errorText: 'Email Inválido!')
                  ]),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      recoveryPass(_controllerEmail.text);
                      Get.offNamed('/login');
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: defaultpd * 4),
                    width: double.infinity,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: scdColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(defaultpd))),
                    child: const Text(
                      'Enviar email',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
