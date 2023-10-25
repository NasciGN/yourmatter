import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_matter/src/utils/constantes.dart';
import 'package:your_matter/src/views/home/components/tab_bar_controller.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget({super.key});

  final _tabBarController = Get.put(TabBarController());
  final widthLineBelow = 3.0;
  final paddingLeftAndRight = 48.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TabBar(
        controller: _tabBarController.controller,
        tabs: _tabBarController.myTabs,
        indicator: buildUnderlineTabIndicator(),
      ),
    );
  }

  buildUnderlineTabIndicator() {
    return UnderlineTabIndicator(
      borderSide: buildBorderSide(),
      insets: buildInsets(),
    );
  }

  buildBorderSide() {
    return BorderSide(
      width: widthLineBelow,
      color: bgColor,
    );
  }

  buildInsets() {
    return EdgeInsets.symmetric(horizontal: paddingLeftAndRight);
  }
}
