import 'package:flutter/material.dart';

import 'package:your_matter/src/core/colors/custom_colors.dart';
import 'package:your_matter/src/views/login/components/login_widget.dart';
import 'package:your_matter/src/views/login/components/welcome_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor2,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      reverse: true,
      child: Stack(children: [
        WelcomeWidget(),
        LoginWidget(),
      ]),
    );
  }
}
