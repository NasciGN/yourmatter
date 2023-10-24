import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_matter/resources/account_menu.dart';
import 'package:your_matter/resources/auth.dart';
import 'package:your_matter/utils/constantes.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();

  String displayName = 'Nome';
  late User onlineUser;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        onlineUser = user;
        _controllerNome.text = user.displayName ?? '';
        _controllerEmail.text = user.email ?? '';
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerNome.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor2,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .1),
        child: AppBar(
          backgroundColor: Colors.transparent, // Torna a AppBar transparente
          elevation: 0, // Remove a sombra da AppBar
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black, // Define a cor do botão de retroceder
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Color(0xFF907691),
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 140,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: size.height * .1,
                child: const Text(
                  'MEU PERFIL',
                  style: TextStyle(
                      color: bgColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: size.height,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          'Atualizar dados',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: bgColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _controllerNome,
                            //validator: Validatorless.required('Digite seu nome'),
                            decoration: InputDecoration(
                              labelText: 'Digite seu nome',
                              labelStyle: const TextStyle(
                                  color: bgColor), // Cor do rótulo
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: bgColor),
                                borderRadius: BorderRadius.circular(defaultpd),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: bgColor),
                                // Cor da borda quando selecionado
                                borderRadius: BorderRadius.circular(defaultpd),
                              ),
                            ),
                            style: const TextStyle(color: bgColor),
                            onFieldSubmitted: (String value) async {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _controllerEmail,
                            //validator: Validatorless.required('Digite seu nome'),
                            decoration: InputDecoration(
                              labelText: 'Digite seu nome',
                              labelStyle: const TextStyle(
                                  color: bgColor), // Cor do rótulo
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: bgColor),
                                borderRadius: BorderRadius.circular(defaultpd),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: bgColor),
                                // Cor da borda quando selecionado
                                borderRadius: BorderRadius.circular(defaultpd),
                              ),
                            ),
                            style: const TextStyle(color: bgColor),
                            onFieldSubmitted: (String value) async {},
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await updateUser(
                                  _controllerNome.text, _controllerEmail.text);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: scdColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(defaultpd))),
                              child: const Text(
                                'Atualizar',
                                style: TextStyle(
                                    color: bgColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      )),
                  const AccountMenu(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
