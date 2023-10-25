import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:your_matter/src/controllers/resources/auth.dart';
import 'package:your_matter/src/core/colors/custom_colors.dart';

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed('/login');
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: bgColor,
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
            margin: const EdgeInsets.only(top: 5),
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
              top: 10,
            ),
            margin: EdgeInsets.only(top: size.height * 0.25),
            height: size.height * 0.60,
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          top: defaultpd, bottom: defaultpd * 2),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recuperar senha",
                          style: TextStyle(
                            fontFamily: 'Sansation',
                            fontWeight: FontWeight.bold,
                            color: bgColor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Digite o endereço de email utilizado parfa acessar a conta que enviaremos um email de recuperação.',
                      style: TextStyle(
                        color: bgColor,
                        fontSize: 18,
                        fontFamily: 'Sansation',
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Digite seu e-mail',
                          style: TextStyle(
                              color: Color.fromRGBO(26, 76, 97, 1),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sansation',
                              fontSize: 16),
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _controllerEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 18, 51, 65)),
                        filled: true,
                        fillColor: bgform,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 18, 51, 65)),
                          borderRadius: BorderRadius.circular(borderform),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 18, 51,
                                  65)), // Cor da borda quando selecionado
                          borderRadius: BorderRadius.circular(borderform),
                        ),
                      ),
                      style: const TextStyle(color: bgColor),
                      // Cor do texto
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Esse campo é obrigatório!'),
                        EmailValidator(errorText: 'Email Inválido!')
                      ]),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {});
                          recoveryPass(_controllerEmail.text);
                          Get.offNamed('/login');
                          setState(() {});
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: defaultpd * 4),
                        width: double.infinity,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: bgColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(borderform))),
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
