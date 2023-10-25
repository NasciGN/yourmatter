import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_matter/src/controllers/user_controller.dart';
import 'package:your_matter/src/utils/constantes.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({super.key});

  final _userController = UserController();
  late final _greetings = 'Olá, ${_userController.getUserName()}';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgform,
      child: buildHeaderWidget(),
    );
  }

  buildHeaderWidget() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAccountWidget(),
            SizedBox(
              height: 20,
            ),
            buildGreetingsWidget(),
          ],
        ));
  }

  buildAccountWidget() {
    return Row(
      children: [
        buildCircleAvatarAccountButton(),
        Spacer(),
        buildMoreVertIconButton(),
      ],
    );
  }

  buildCircleAvatarAccountButton() {
    return GestureDetector(
        child: const CircleAvatar(
          backgroundColor: btnColor,
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        ),
        onTap: () => Get.toNamed('/account'));
  }

  buildMoreVertIconButton() {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.more_vert,
          color: bgColor,
        ));
  }

  buildGreetingsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(_greetings, style: buildTextStyle()),
      ],
    );
  }

  buildTextStyle() {
    return const TextStyle(
        fontSize: 26.0, fontWeight: FontWeight.bold, color: bgColor);
  }
}
