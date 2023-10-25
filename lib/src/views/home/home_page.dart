import 'package:flutter/material.dart';
import 'package:your_matter/src/controllers/notebook_controller.dart';

import 'package:your_matter/src/views/home/components/header_widget.dart';
import 'package:your_matter/src/views/home/components/tab_bar_widget.dart';
import 'package:your_matter/src/views/home/components/tab_bar_view_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _notebookController = NotebookController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(),
      body: _buildBody(),
    );
  }

  _buildFloatingActionButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 15),
      child: FloatingActionButton(
          onPressed: () => _notebookController.createNewNote(),
          child: _buildFloatingActionButtonIcon()),
    );
  }

  _buildFloatingActionButtonIcon() {
    return const Icon(
      Icons.add_outlined,
      color: Colors.white,
    );
  }

  _buildBody() {
    return SafeArea(
      child: Column(children: [
        HeaderWidget(),
        TabBarWidget(),
        TabBarViewWidget(),
      ]),
    );
  }
}
