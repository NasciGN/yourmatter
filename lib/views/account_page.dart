import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_matter/controllers/resources/account_menu.dart';
import 'package:your_matter/controllers/resources/auth.dart';
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
    return Scaffold(
      backgroundColor: bgColor2,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundColor: const Color(0xFF907691),
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 140,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'MEU PERFIL',
            style: TextStyle(
              fontFamily: 'Sansation',
              color: bgColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nome',
                style: TextStyle(
                  fontFamily: 'Sansation',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: bgColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _controllerNome,
                decoration: InputDecoration(
                  labelText: 'Digite seu nome',
                  labelStyle: const TextStyle(
                    color: bgColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: bgColor),
                    borderRadius: BorderRadius.circular(borderform),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: bgColor),
                    borderRadius: BorderRadius.circular(borderform),
                  ),
                ),
                style: const TextStyle(
                  color: bgColor,
                  fontFamily: 'Sansation',
                  fontSize: 20,
                ),
                onFieldSubmitted: (String value) async {},
              ),
              const SizedBox(height: 20),
              Text(
                'E-mail',
                style: TextStyle(
                  fontFamily: 'Sansation',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: bgColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _controllerEmail,
                decoration: InputDecoration(
                  labelText: 'Digite seu e-mail',
                  labelStyle: const TextStyle(
                    color: bgColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: bgColor),
                    borderRadius: BorderRadius.circular(borderform),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: bgColor),
                    borderRadius: BorderRadius.circular(borderform),
                  ),
                ),
                style: const TextStyle(
                  color: bgColor,
                  fontFamily: 'Sansation',
                  fontSize: 20,
                ),
                onFieldSubmitted: (String value) async {},
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  await updateUser(_controllerNome.text, _controllerEmail.text);
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultpd),
                    ),
                  ),
                  child: const Text(
                    'Atualizar',
                    style: TextStyle(
                      fontFamily: 'Sansation',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const AccountMenu(),
        ],
      ),
    );
  }
}
