// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
final User? currentUser = auth.currentUser;
String? userId = currentUser?.uid;

Future<void> createUser(context, email, pass) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    String userId = credential.user?.uid ?? '';
    saveUserRegister(userId, email);
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
}

Future<void> saveUserRegister(
  final userId,
  userEmail,
) async {
  final registerUser = <String, String>{
    "createDt": "${FieldValue.serverTimestamp()}",
    "userID": "$userId",
    "userEmail": "$userEmail",
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
        topOnAppearance: 100,
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
