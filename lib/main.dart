import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:your_matter/utils/constantes.dart';
import 'package:your_matter/views/account_page.dart';
import 'package:your_matter/views/home_page.dart';
import 'package:your_matter/views/login_page.dart';
import 'package:your_matter/views/logon_page.dart';
import 'resources/firebase_options.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/logon', page: () => const LogonPage()),
        GetPage(name: '/account', page: () => const AccountPage()),
      ],
      builder: EasyLoading.init(), // Inicialize o EasyLoading aqui
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Defina a página inicial do seu aplicativo
    );
  }
}
