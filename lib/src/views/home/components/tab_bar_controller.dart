import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_matter/src/core/colors/custom_colors.dart';

class TabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {

  final List<Tab> myTabs = <Tab>[
    Tab(child: Text('Cadernos', style: buildTextStyle())),
    Tab(child: Text('Turmas', style: buildTextStyle()))
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  static buildTextStyle() {
    return GoogleFonts.roboto(
        color: bgColor,
        letterSpacing: 1,
        fontSize: 17,
        fontWeight: FontWeight.bold);
  }
}
