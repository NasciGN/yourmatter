import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_matter/src/views/logon/components/logon_form.dart';
import '../../core/colors/custom_colors.dart';


class LogonPage extends StatefulWidget {
  const LogonPage({super.key});

  @override
  State<LogonPage> createState() => _LogonPageState();
}

class _LogonPageState extends State<LogonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed('/login');
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: bgColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: bgaccount,
      body: SingleChildScrollView(
        reverse: true,
        child: GestureDetector(
          child: Stack(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: const LogonForm(),
            ),
          ]),
        ),
      ),
    );
  }
}
