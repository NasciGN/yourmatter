import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_matter/src/controllers/resources/firebase_options.dart';

import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'src/views/views.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          FirebaseAuth.instance.currentUser != null ? '/home' : '/login',
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/logon', page: () => const LogonPage()),
        GetPage(name: '/account', page: () => const AccountPage()),
        GetPage(name: '/recoveryPass', page: () => const RecoveryPassPage()),
      ],
      builder: EasyLoading.init(), // Inicialize o EasyLoading aqui
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Defina a página inicial do seu aplicativo
    );
  }
}
