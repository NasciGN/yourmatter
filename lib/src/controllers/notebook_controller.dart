import 'package:get/get.dart';
import 'package:your_matter/src/views/notebook/new_page.dart';

import '../models/page.dart';

class NotebookController {

  void createNewNote() {
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
    Get.to(NewPage(
      note: note,
      isNewNote: isNewNote,
    ));
  }
}