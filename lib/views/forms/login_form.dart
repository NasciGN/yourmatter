import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../controllers/resources/auth.dart';
import '../../utils/constantes.dart';
import '../logon_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
  }

  bool _isObscure = true;

  // ignore: unused_field
  bool _isLoading = false;
  bool? _rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: defaultpd * 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Acesse",
                  style: TextStyle(
                      color: Color.fromRGBO(26, 76, 97, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .45,
              child: Column(children: [
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
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 18, 51, 65)),
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
                  style: const TextStyle(
                      color: Color.fromRGBO(26, 76, 97, 1),
                      fontSize: 16,
                      fontFamily: 'Sansation'),
                  // Cor do texto
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Esse campo é obrigatório!'),
                    EmailValidator(errorText: 'Email Inválido!')
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Digite sua senha',
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
                    obscureText: _isObscure,
                    controller: _controllerPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style:
                        const TextStyle(color: Color.fromARGB(255, 18, 51, 65)),
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: const TextStyle(
                            color: Color.fromRGBO(26, 76, 97, 1),
                            fontSize: 16,
                            fontFamily: 'Sansation'),
                        filled: true,
                        fillColor: bgform,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 18, 51, 65)),
                            borderRadius: BorderRadius.circular(borderform)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 18, 51, 65)),
                            borderRadius: BorderRadius.circular(borderform)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          child: Icon(
                            _isObscure
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: Color.fromRGBO(26, 76, 97, 1),
                          ),
                        )),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Esse campo é obrigatório!'),
                      LengthRangeValidator(
                          min: 6,
                          max: 20,
                          errorText:
                              'A senha deve ter no mínimo 6 e no máximo de 20 caracteres!')
                    ])),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            focusColor: bgColor,
                            unselectedWidgetColor:
                                Color.fromRGBO(26, 76, 97, 1),
                          ),
                          child: Checkbox(
                            shape: CircleBorder(
                                side: BorderSide(width: defaultpd * 2)),
                            checkColor: Colors.white,
                            activeColor: bgColor,
                            value: _rememberPassword ?? false,
                            onChanged: (value) {
                              setState(() {
                                _rememberPassword = value;
                              });
                            },
                          ),
                        ),
                        const Text(
                          'Lembrar senha',
                          style: TextStyle(
                              color: Color.fromRGBO(26, 76, 97, 1),
                              fontSize: 15,
                              fontFamily: 'Sansation'),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () async {
                          Get.offNamed('/recoveryPass');
                        },
                        child: const Text(
                          'Esqueci minha senha',
                          style: TextStyle(
                              color: Color.fromRGBO(26, 76, 97, 1),
                              fontSize: 15,
                              fontFamily: 'Sansation',
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      await loginUser(context, _controllerEmail.text,
                          _controllerPassword.text);
                      Get.offAndToNamed('/home');
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(26, 76, 97, 1),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      'Acessar',
                      style: TextStyle(
                          fontFamily: 'Sansation',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Não possui uma conta?  ",
              style: TextStyle(
                  color: Color.fromRGBO(26, 76, 97, 1),
                  fontSize: 15,
                  fontFamily: 'Sansation'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LogonPage()));
              },
              child: const Text(
                "Crie uma conta grátis aqui",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Sansation'),
              ),
            )
          ],
        ));
  }
}
