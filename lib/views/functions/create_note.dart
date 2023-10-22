import 'package:flutter/material.dart';
import 'package:your_matter/models/page.dart';
import 'package:your_matter/resources/firestore_methods.dart';

class EditNotePage extends StatefulWidget {
  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController documentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(240, 230, 140, 0.4),
      ),
      body: Container(
        color: const Color.fromRGBO(240, 230, 140, 0.4),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Define o alinhamento à esquerda
          children: [
            Text(
              'Tarefa *',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Digite o nome da tarefa',
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Descrição *',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: documentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Descrição da tarefa',
                contentPadding: EdgeInsets.all(16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 15), // Adicione um espaço entre os campos
            ListTile(
              title: Text(
                'Teste',
              ),
              trailing: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        documentController.text.isNotEmpty) {
                      final pageController = FirebaseService();

                      Page note = Page(
                          document: documentController.text,
                          searchableDocument: titleController.text,
                          title: titleController.text,
                          turma: 'teste',
                          date: DateTime.now(),
                          uid: '20hrn03hr23');
                      pageController.addNote(note);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Por favor, preencha todos os campos obrigatórios.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  child: const Text('Adicionar Tarefa'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
