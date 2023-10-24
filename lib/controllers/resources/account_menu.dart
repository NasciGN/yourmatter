import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:your_matter/controllers/resources/auth.dart';

class AccountMenu extends StatefulWidget {
  const AccountMenu({super.key});

  @override
  State<AccountMenu> createState() => _AccountMenuState();
}

class _AccountMenuState extends State<AccountMenu> {
  String displayName = 'Nome';
  late User onlineUser;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        onlineUser = user;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            height: 45,
            padding: const EdgeInsets.fromLTRB(20, 0, 18, 0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Editar senha',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Recuperar sua senha?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      try {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: onlineUser.email!);
                        EasyLoading.instance.toastPosition =
                            EasyLoadingToastPosition.bottom;
                        EasyLoading.showToast('Email de recuperação enviado!');
                      } catch (e) {
                        EasyLoading.showToast(
                            'Erro ao enviar email de recuperação.');
                        // Error
                      }
                    },
                    child: const Text('Enviar e-mail'),
                  ),
                ],
              ),
            );
          },
        ),
        GestureDetector(
          child: Container(
            height: 45,
            padding: const EdgeInsets.fromLTRB(20, 0, 18, 0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Excluir minha conta',
                        style: TextStyle(fontSize: 15, color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right, color: Colors.redAccent),
              ],
            ),
          ),
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'Excluir sua conta?',
                ),
                content: const Text('Essa ação não poderá ser desfeita.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        onlineUser.delete();
                        EasyLoading.showToast('Conta excluída');
                        deleteDocID(currentUser?.uid);
                      } catch (e) {
                        EasyLoading.showToast('Erro ao excluir');
                        // Error
                      }
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login', (Route<dynamic> route) => false);
                    },
                    child: const Text('Excluir',
                        style: TextStyle(color: Colors.redAccent)),
                  ),
                ],
              ),
            );
          },
        ),
        GestureDetector(
          child: Container(
            height: 45,
            padding: const EdgeInsets.fromLTRB(20, 0, 18, 0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Sair',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Deseja sair?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      try {
                        FirebaseAuth.instance.signOut();
                        EasyLoading.instance.toastPosition =
                            EasyLoadingToastPosition.bottom;
                        EasyLoading.showToast('Saiu');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login', (Route<dynamic> route) => false);
                      } catch (e) {
                        EasyLoading.showToast('Erro ao sair');
                        // Error
                      }
                    },
                    child: const Text('Sair',
                        style: TextStyle(color: Colors.redAccent)),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
