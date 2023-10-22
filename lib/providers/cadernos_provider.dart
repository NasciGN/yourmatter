import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import '../models/page.dart';

class PageControl {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
  Future<void> addPageWithUserId(myPage page) async {
    final userId = await getUserId();
    final PageData = {
      'content': page.content,
      'title': page.title,
      'turma': page.turma,
      'date': page.date,
      'uid': userId, // Defina o UID com o ID do usuário logado
      'searchableDocument': page.searchableDocument,
    };
    if (userId != null) {
      await FirebaseFirestore.instance.collection('pages').add(PageData);
    } else {
      if (kDebugMode) {
        print("Nenhum usuário autenticado.");
      }
    }
  }

  // Editar uma página existente com o ID do usuário logado
  Future<void> editPageWithUserId(myPage page) async {
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
  Future<myPage?> getPageByUserId() async {
    final userId = await getUserId();
    if (userId != null) {
      final collection = FirebaseFirestore.instance.collection('pages');
      final doc = await collection.doc(userId).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return myPage(
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

  Stream<List<myPage>> getPagesForCurrentUser() {
    return _auth.authStateChanges().switchMap((user) {
      if (user != null) {
        final userId = user.uid;
        return _firestore
            .collection('pages')
            .where('uid', isEqualTo: userId)
            .snapshots()
            .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data();
            // Converter o campo 'date' de Timestamp para DateTime
            final dateTimestamp = data['date'] as Timestamp;
            final date = dateTimestamp.toDate();

            // Criar um novo mapa com a atualização do campo 'date'
            final updatedData = {
              ...data,
              'date': date,
            };

            return myPage.fromJson(updatedData);
          }).toList();
        });
      } else {
        // Retorna um Stream vazio caso não haja usuário logado.
        return Stream.value([]);
      }
    });
  }
}
