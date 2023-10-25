import 'package:flutter/material.dart';
import 'package:your_matter/src/models/page.dart';
import 'package:your_matter/src/utils/constantes.dart';
import 'package:your_matter/src/views/functions/create_Page.dart';

import 'package:your_matter/src/views/home/components/header_widget.dart';
import 'package:your_matter/src/views/home/components/tab_bar_widget.dart';
import 'package:your_matter/src/views/home/components/tab_bar_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      body: buildBody(),
    );
  }

  buildFloatingActionButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 15),
      child: FloatingActionButton(
        onPressed: () => _createNewNote(),
        backgroundColor: btnColor,
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  buildBody() {
    return SafeArea(
      child: Column(children: [
        HeaderWidget(),
        TabBarWidget(),
        TabBarViewWidget(),
      ]),
    );
  }

  void _createNewNote() {
    myPage newNote = myPage(
        id: '',
        content: '',
        searchableDocument: '',
        title: '',
        turma: '',
        uid: '',
        bgColor: [],
        borderColor: []);

    _goToNewPage(newNote, true);
  }

  void _goToNewPage(myPage note, bool isNewNote) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewPage(
                  note: note,
                  isNewNote: isNewNote,
                )));
  }
}
