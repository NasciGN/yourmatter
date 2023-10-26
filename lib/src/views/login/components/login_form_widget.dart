import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../controllers/resources/auth.dart';
import '../../../core/colors/custom_colors.dart';
import '../../logon/logon_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  bool _isObscure = true;
  bool? _rememberPassword = false;
  // ignore: unused_field
  bool _isLoading = false;

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

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildTitle(),
            _buildLoginForm(),
            _buildCreateAccount(),
          ],
        ));
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: defaultpd * 2),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Acesse", style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }

  _buildLoginForm() {
    return SizedBox(
      height: Get.height * .45,
      child: Column(children: [
        _buildEmailField(),
        _buildPasswordField(),
        _buildPasswordOptions(),
        const Spacer(),
        _buildLoginButton(),
      ]),
    );
  }

  _buildEmailField() {
    return Column(
      children: [
        _buildEmailTitle(),
        _buildEmailTextFormField(),
      ],
    );
  }

  _buildEmailTitle() {
    return Container(
        alignment: Alignment.topLeft,
        child: Text('Digite seu e-mail',
            style: Theme.of(context).textTheme.displayMedium));
  }

  _buildEmailTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: TextFormField(
        controller: _controllerEmail,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: _buildEmailTextFormFieldDecoration(),
        style: Theme.of(context).textTheme.displayMedium,
        validator: MultiValidator([
          RequiredValidator(errorText: 'Esse campo é obrigatório!'),
          EmailValidator(errorText: 'Email Inválido!')
        ]),
      ),
    );
  }

  _buildEmailTextFormFieldDecoration() {
    return InputDecoration(
        labelText: 'E-mail',
        labelStyle: const TextStyle(color: Color.fromARGB(255, 18, 51, 65)));
  }

  _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          _buildPasswordTitle(),
          _buildPasswordTextFormField(),
        ],
      ),
    );
  }

  _buildPasswordTitle() {
    return Container(
        alignment: Alignment.topLeft,
        child: Text('Digite sua senha',
            style: Theme.of(context).textTheme.displayMedium));
  }

  _buildPasswordTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: TextFormField(
          obscureText: _isObscure,
          controller: _controllerPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(color: Color.fromARGB(255, 18, 51, 65)),
          decoration: _buildPasswordTextFormFieldDecoration(),
          validator: MultiValidator([
            RequiredValidator(errorText: 'Esse campo é obrigatório!'),
            LengthRangeValidator(
                min: 6,
                max: 20,
                errorText:
                    'A senha deve ter no mínimo 6 e no máximo de 20 caracteres!')
          ])),
    );
  }

  _buildPasswordTextFormFieldDecoration() {
    return InputDecoration(
        labelText: 'Senha',
        labelStyle: Theme.of(context).textTheme.displayMedium,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          child: Icon(
            _isObscure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
            color: Color.fromRGBO(26, 76, 97, 1),
          ),
        ));
  }

  _buildPasswordOptions() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPasswordRememberToggle(),
          _buildPasswordForgotButton(),
        ],
      ),
    );
  }

  _buildPasswordRememberToggle() {
    return Row(
      children: [
        Theme(
          data: ThemeData(
            focusColor: bgColor,
            unselectedWidgetColor: Color.fromRGBO(26, 76, 97, 1),
          ),
          child: Checkbox(
            shape: CircleBorder(side: BorderSide(width: defaultpd * 2)),
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
        Text(
          'Lembrar senha',
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }

  _buildPasswordForgotButton() {
    return TextButton(
        onPressed: () async {
          Get.offNamed('/recoveryPass');
        },
        child: Text(
          'Esqueci minha senha',
          style: Theme.of(context).textTheme.displayMedium,
        ));
  }

  _buildLoginButton() {
    return GestureDetector(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          setState(() {
            _isLoading = true;
          });
          await loginUser(
              context, _controllerEmail.text, _controllerPassword.text);
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
        child: Text(
          'Acessar',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }

  _buildCreateAccount() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Text(
            "Não possui uma conta?  ",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/logon'),
            child: Text(
              "Crie uma conta grátis aqui",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          )
        ],
      ),
    );
  }
}
