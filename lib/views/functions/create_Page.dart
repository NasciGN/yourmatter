import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:your_matter/models/page.dart';
import 'package:your_matter/providers/cadernos_provider.dart';

class NewPage extends StatefulWidget {
  myPage note;
  bool isNewNote;
  NewPage({super.key, required this.note, required this.isNewNote});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  QuillController _controller = QuillController.basic();
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadingExistingNote();
  }

  void loadingExistingNote() {
    final doc = Document()..insert(0, widget.note.content);

    _titleController.text = widget.note.title; // Preencha o TextField com o título

    setState(() {
      _controller = QuillController(
        document: doc,
        selection: TextSelection.collapsed(offset: doc.length),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageControl = PageControl();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            if (widget.isNewNote && !_controller.document.isEmpty()) {
              myPage newNote = myPage(
                  content: _controller.document.toPlainText(),
                  searchableDocument: '',
                  title: _titleController.text,
                  turma: 'turma',
                  uid: '');
              pageControl.addPageWithUserId(newNote);
            } else {}
            Get.offNamed('/home');
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(32),
          child: TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Nome da matéria',
              fillColor: Colors.transparent,
            ),
          ),
        ),
        QuillProvider(
          configurations: QuillConfigurations(controller: _controller),
          child: QuillToolbar.basic(
            showDividers: false,
            showFontFamily: false,
            showFontSize: false,
            showBoldButton: false,
            showItalicButton: false,
            showSmallButton: false,
            showUnderLineButton: false,
            showStrikeThrough: false,
            showInlineCode: false,
            showColorButton: false,
            showBackgroundColorButton: false,
            showClearFormat: false,
            showAlignmentButtons: false,
            showLeftAlignment: false,
            showCenterAlignment: false,
            showRightAlignment: false,
            showJustifyAlignment: false,
            showHeaderStyle: false,
            showListNumbers: false,
            showListBullets: false,
            showListCheck: false,
            showCodeBlock: false,
            showQuote: false,
            showIndent: false,
            showLink: false,
            showDirection: false,
            showSearchButton: false,
            showSubscript: false,
            showSuperscript: false,
          ),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.all(32),
          child: QuillProvider(
            configurations: QuillConfigurations(controller: _controller),
            child: QuillEditor.basic(readOnly: false),
          ),
        ))
      ]),
    );
  }
}
