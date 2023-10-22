import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/page.dart';

class PageController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Obter o ID do usuário logado no Firebase
  Future<String?> getUserId() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }

  // Adicionar uma nova página com o ID do usuário logado
  Future<void> addPageWithUserId(Page page) async {
    final userId = await getUserId();
    if (userId != null) {
      final collection = FirebaseFirestore.instance.collection('pages');
      await collection.doc(userId).set({
        'content': page.content,
        'title': page.title,
        'turma': page.turma,
        'date': page.date,
        'uid': userId, // Defina o UID com o ID do usuário logado
        'searchableDocument': page.searchableDocument,
      });
    } else {
      if (kDebugMode) {
        print("Nenhum usuário autenticado.");
      }
    }
  }

  // Editar uma página existente com o ID do usuário logado
  Future<void> editPageWithUserId(Page page) async {
    final userId = await getUserId();
    if (userId != null) {
      final collection = FirebaseFirestore.instance.collection('pages');
      await collection.doc(userId).update({
        'content': page.content,
        'title': page.title,
        'turma': page.turma,
        'date': page.date,
        'uid': userId, // Defina o UID com o ID do usuário logado
        'searchableDocument': page.searchableDocument,
      });
    } else {
      if (kDebugMode) {
        print("Nenhum usuário autenticado.");
      }
    }
  }

  // Deletar uma página com o ID do usuário logado
  Future<void> deletePageWithUserId() async {
    final userId = await getUserId();
    if (userId != null) {
      final collection = FirebaseFirestore.instance.collection('pages');
      await collection.doc(userId).delete();
    } else {
      if (kDebugMode) {
        print("Nenhum usuário autenticado.");
      }
    }
  }

  // Buscar página por ID de usuário
  Future<Page?> getPageByUserId() async {
    final userId = await getUserId();
    if (userId != null) {
      final collection = FirebaseFirestore.instance.collection('pages');
      final doc = await collection.doc(userId).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return Page(
          content: data['content'],
          title: data['title'],
          turma: data['turma'],
          date: (data['date'] as Timestamp).toDate(),
          uid: data['uid'],
          searchableDocument: data['searchableDocument'],
        );
      }
    }
    return null;
  }
}
