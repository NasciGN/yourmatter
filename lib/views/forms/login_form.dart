import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../resources/auth.dart';
import '../../utils/constantes.dart';
import '../logon_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

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
              padding: EdgeInsets.only(top: defaultpd, bottom: defaultpd * 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Acesse",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .45,
              child: Column(children: [
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
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    obscureText: _isObscure,
                    controller: _controllerPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Digite sua senha',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(defaultpd)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(defaultpd)),
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
                            color: Colors.white,
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
                            unselectedWidgetColor: Colors
                                .white, // Define a cor do Checkbox não selecionado
                          ),
                          child: Checkbox(
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
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () async {},
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(color: Colors.white),
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
                        color: scdColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(defaultpd))),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Não possui uma conta?  ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogonPage()));
                  },
                  child: const Text(
                    "Crie uma conta grátis aqui",
                    style:
                        TextStyle(color: scdColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
