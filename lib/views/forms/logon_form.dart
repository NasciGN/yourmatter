import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../resources/auth.dart';
import '../../utils/constantes.dart';
import '../login_page.dart';

class LogonForm extends StatefulWidget {
  const LogonForm({super.key});

  @override
  State<LogonForm> createState() => _LogonFormState();
}

class _LogonFormState extends State<LogonForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword1 = TextEditingController();
  TextEditingController _controllerPassword2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerNome.dispose();
    _controllerEmail.dispose();
    _controllerPassword1.dispose();
    _controllerPassword2.dispose();
  }

  bool _isObscure = true;

  // ignore: unused_field
  bool _isLoading = false;
  bool? _isProfessor = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: borderform, bottom: borderform * 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(
                      color: bgColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              child: Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Digite seu nome',
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
                  controller: _controllerNome,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: const TextStyle(color: bgColor),
                    filled: true,
                    fillColor: bgform,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: bgColor),
                      borderRadius: BorderRadius.circular(borderform),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: bgColor), // Cor da borda quando selecionado
                      borderRadius: BorderRadius.circular(borderform),
                    ),
                  ),
                  style: const TextStyle(color: bgColor),
                  // Cor do texto
                  validator: (value) {
                    // Use uma expressão regular para verificar se o valor contém apenas letras e espaços.
                    // ^[A-Za-z ]+$ significa que aceitaremos apenas letras maiúsculas, minúsculas e espaços.
                    final pattern = RegExp(r'^[A-Za-z ]+$');
                    if (!pattern.hasMatch(value ?? '')) {
                      return 'Digite um nome válido';
                    }
                    return null; // Retornar nulo se o valor for válido.
                  },
                ),
                const SizedBox(
                  height: 20,
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
                    labelStyle: const TextStyle(color: bgColor),
                    filled: true,
                    fillColor: bgform,
                    // Cor do rótulo
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: bgColor),
                      borderRadius: BorderRadius.circular(borderform),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color:
                              Colors.white), // Cor da borda quando selecionado
                      borderRadius: BorderRadius.circular(borderform),
                    ),
                  ),
                  style: const TextStyle(color: bgColor),
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
                  controller: _controllerPassword1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: bgColor),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: const TextStyle(color: bgColor),
                    filled: true,
                    fillColor: bgform,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: bgColor),
                      borderRadius: BorderRadius.circular(borderform),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: bgColor),
                      borderRadius: BorderRadius.circular(borderform),
                    ),
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
                        color: bgColor,
                      ),
                    ),
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Esse campo é obrigatório!'),
                    LengthRangeValidator(
                        min: 6,
                        max: 20,
                        errorText:
                            'A senha deve ter no mínimo 6 e no máximo de 20 caracteres!')
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Confirme sua senha',
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
                  controller: _controllerPassword2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: bgColor),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: const TextStyle(color: bgColor),
                    filled: true,
                    fillColor: bgform,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: bgColor),
                      borderRadius: BorderRadius.circular(borderform),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: bgColor),
                      borderRadius: BorderRadius.circular(borderform),
                    ),
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
                        color: bgColor,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value != _controllerPassword1.text) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                bgColor, // Define a cor do Checkbox não selecionado
                          ),
                          child: Checkbox(
                            value: _isProfessor ?? false,
                            onChanged: (value) {
                              setState(() {
                                _isProfessor = value;
                              });
                            },
                          ),
                        ),
                        const Text(
                          'É Professor',
                          style: TextStyle(color: bgColor),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      await createUser(
                          context,
                          _controllerNome.text,
                          _controllerEmail.text,
                          _controllerPassword1.text,
                          _isProfessor);
                      Get.offAndToNamed('/login');
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
                        color: bgColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(borderform))),
                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sansation',
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
              "Já possui uma conta? ",
              style: TextStyle(
                color: bgColor,
                fontFamily: 'Sansation',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text(
                "Entre com ela por aqui",
                style: TextStyle(color: scdColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
