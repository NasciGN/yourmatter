import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_matter/src/views/home/components/tab_bar_controller.dart';
import '../../views.dart';

class TabBarViewWidget extends StatelessWidget {
  TabBarViewWidget({super.key});

  final _tabBarController = Get.put(TabBarController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: TabBarView(
          controller: _tabBarController.controller,
          children: const [MeusCadernos(), MinhasTurmas()],
        ),
      ),
    );
  }
}
