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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            size.height * .1), // Define a altura zero para a AppBar
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
            SizedBox(
              height: size.height * .1,
              child: const Text(
                'Minha Conta',
                style: TextStyle(
                    color: Color.fromARGB(255, 18, 51, 65),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: size.height * .8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultpd * 2),
                    topRight: Radius.circular(defaultpd * 2)),
                color: bgColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(defaultpd),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            'Conta',
                            style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 25, 0, 30),
                      child: Row(
                        children: [
                          Text(
                            'Atualizar dados',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 5),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _controllerNome,
                              //validator: Validatorless.required('Digite seu nome'),
                              decoration: InputDecoration(
                                labelText: 'Digite seu nome',
                                labelStyle: const TextStyle(
                                    color: Colors.white), // Cor do rótulo
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.circular(defaultpd),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors
                                          .white), // Cor da borda quando selecionado
                                  borderRadius:
                                      BorderRadius.circular(defaultpd),
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
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
                                    color: Colors.white), // Cor do rótulo
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.circular(defaultpd),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors
                                          .white), // Cor da borda quando selecionado
                                  borderRadius:
                                      BorderRadius.circular(defaultpd),
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                              onFieldSubmitted: (String value) async {},
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await updateUser(_controllerNome.text,
                                    _controllerEmail.text);
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const Spacer(),
                    const AccountMenu(),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
