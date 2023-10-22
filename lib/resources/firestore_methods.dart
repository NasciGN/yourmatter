import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_matter/models/page.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNote(Page page) async {
    try {
      await _firestore.collection('notes').add(page.toJson());
      print("Nota salva com sucesso!");
    } catch (e) {
      print("Erro ao salvar a nota: $e");
    }
  }
}
