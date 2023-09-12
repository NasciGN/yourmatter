// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
final User? currentUser = auth.currentUser;
String? userId = currentUser?.uid;

Future<void> createUser(context, name, email, pass, isprofessor) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );

    User? user = userCredential.user;

    if (user != null) {
      // ignore: deprecated_member_use
      await user.updateProfile(displayName: name);
      await user.reload(); // Recarrega o usuário para aplicar as alterações
      user = FirebaseAuth.instance.currentUser; // Obtém o usuário atualizado
    }
    String userId = userCredential.user?.uid ?? '';
    saveUserRegister(userId, isprofessor);
  } catch (e) {
    print('Erro ao criar a conta: $e');
  }
}

Future<void> updateUser(nome, email) async {
  try {
    await currentUser?.updateProfile(displayName: nome);
    if (email != currentUser?.email) {
      await currentUser?.updateEmail(email);
    }
  } catch (e) {
    print('Erro ao atualizar os dados: $e');
  }
}
/* Future<void> createUser(context, name, email, pass, isprofessor) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    String userId = credential.user?.uid ?? '';
    saveUserRegister(userId, name, email, isprofessor);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      AnimatedSnackBar.material(
        'Senha muito pequena...',
        type: AnimatedSnackBarType.error,
        desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
      ).show(context);
    } else if (e.code == 'email-already-in-use') {
      AnimatedSnackBar.material(
        'Esse email ja está cadastrado...',
        type: AnimatedSnackBarType.error,
        desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
      ).show(context);
    }
  } catch (e) {
    print(e);
  }
} */

Future<void> getUserData(context, userid) async {
  try {
    QuerySnapshot querySnapshot =
        await db.collection("users").where("userid", isEqualTo: userid).get();
    final documents = querySnapshot.docs;
    for (final document in documents) {
      document.reference.delete();
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      AnimatedSnackBar.material(
        'Email ja utilizado',
        type: AnimatedSnackBarType.error,
        desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
      ).show(context);
      //print('No user found for that email.');
      throw Exception('No user found for that email.');
    }
  } catch (error) {
    print('Erro 3034: $error');
  }
}

Future<bool?> isUserProfessor(userid) async {
  QuerySnapshot userSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('userid', isEqualTo: userid)
      .get();
  if (userSnapshot.docs.isNotEmpty) {
    DocumentSnapshot document = userSnapshot.docs.first;
    bool isProfessor = document['professor'];
    return isProfessor;
  }
  return null;
}

Future<void> deleteDocID(userid) async {
  try {
    QuerySnapshot querySnapshot =
        await db.collection("users").where("userid", isEqualTo: userid).get();
    final documents = querySnapshot.docs;
    for (final document in documents) {
      document.reference.delete();
    }
  } catch (error) {
    print('Erro 3034: $error');
  }
}

Future<void> saveUserRegister(
  userid,
  isprofessor,
) async {
  final registerUser = <String, String>{
    "userid": "$userid",
    "professor": "$isprofessor"
  };

  try {
    await db.collection("users").add(registerUser);
  } catch (e) {
    print('Erro ao cadastrar o usuário: $e');
  }
}

Future<void> loginUser(context, email, pass) async {
  try {
    // ignore: unused_local_variable
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
    AnimatedSnackBar.material(
      'Login efetuado com sucesso',
      type: AnimatedSnackBarType.info,
      mobilePositionSettings: const MobilePositionSettings(
        topOnAppearance: 50,
        // topOnDissapear: 50,
        // bottomOnAppearance: 100,
        // bottomOnDissapear: 50,
        // left: 20,
        // right: 70,
      ),
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
    ).show(context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      AnimatedSnackBar.material(
        'Login Incorreto ou inexistente',
        type: AnimatedSnackBarType.error,
        desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
      ).show(context);
      //print('No user found for that email.');
      throw Exception('No user found for that email.');
    } else if (e.code == 'auth/wrong-password') {
      AnimatedSnackBar.material(
        'Login ou senha incorretos',
        type: AnimatedSnackBarType.error,
        desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
      ).show(context);
      //print('Wrong password provided for that user.');
      throw Exception('Wrong password provided for that user.');
    } else {
      AnimatedSnackBar.material(
        'Opa, algo de errado aconteceu...',
        type: AnimatedSnackBarType.error,
        desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
      ).show(context);
    }
  } catch (e) {
    //print('Error occurred: $e');
    throw Exception('Error occurred: $e');
  }
}
