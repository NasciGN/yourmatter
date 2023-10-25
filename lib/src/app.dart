import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:your_matter/src/core/routes/custom_pages.dart';
import 'package:your_matter/src/core/themes/custom_theme.dart';

class YourMatterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your Matter',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: customTheme(),
      getPages: customGetPages,
      initialRoute: verifyInitialRoute(),
    );
  }

  verifyInitialRoute() {
    return FirebaseAuth.instance.currentUser != null ? '/home' : '/login';
  }
}
