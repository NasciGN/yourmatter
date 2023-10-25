import 'package:flutter/material.dart';
import 'package:your_matter/src/core/colors/custom_colors.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultpd * 2),
      width: double.infinity,
      child: _buildWelcomeWidget(),
    );
  }

  _buildWelcomeWidget() {
    return Column(
      children: [
        SizedBox(height: defaultpd * 3,),
        _buildWelcomeText(),
        _buildYourMatterText(),
      ],
    );
  }

  _buildWelcomeText() {
    return Text("Bem vindo ao", style: _buildWelcomeTextStyle());
  }

  _buildWelcomeTextStyle() {
    return TextStyle(
        fontFamily: 'Sansation',
        color: Color.fromRGBO(26, 76, 97, 1),
        fontWeight: FontWeight.bold,
        letterSpacing: 5,
        fontSize: 30);
  }

  _buildYourMatterText() {
    return Text("YourMatter", style: _buildYourMatterTextStyle());
  }

  _buildYourMatterTextStyle() {
    return TextStyle(
        fontFamily: 'Bridht Melody',
        color: Color.fromRGBO(26, 76, 97, 1),
        fontWeight: FontWeight.bold,
        fontSize: 50);
  }
}
