import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_matter/src/app.dart';
import 'package:your_matter/src/controllers/resources/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(YourMatterApp());
}
