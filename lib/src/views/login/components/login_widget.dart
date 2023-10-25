import 'package:flutter/material.dart';

import 'package:your_matter/src/core/colors/custom_colors.dart';
import 'package:your_matter/src/views/login/components/login_form_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: _buildPadding(),
      margin: EdgeInsets.only(top: size.height * 0.3),
      height: size.height * 0.7,
      decoration: _buildDecoration(),
      child: const LoginForm(),
    );
  }

  _buildPadding() {
    return const EdgeInsets.only(
      right: defaultpd * 2,
      left: defaultpd * 2,
      top: defaultpd * 2,
    );
  }

  _buildDecoration() {
    return const BoxDecoration(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(defaultpd * 4),
    ));
  }
}
