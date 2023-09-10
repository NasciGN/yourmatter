import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:your_matter/views/login_page.dart';
import 'resources/firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    initialRoute: '/login',
    getPages: [
      GetPage(name: '/login', page: () => const LoginPage()),
    ],
  ));
}
