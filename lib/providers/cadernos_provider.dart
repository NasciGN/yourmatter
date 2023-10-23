import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:your_matter/main.dart';
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
      'id': FirebaseFirestore.instance.collection('rooms').doc().id,
      'content': page.content,
      'title': page.title,
      'turma': page.turma,
      'uid': userId, // Defina o UID com o ID do usuário logado
      'searchableDocument': page.searchableDocument,
    };
    if (userId != null) {
      if (userId != null) {
        final documentReference = await FirebaseFirestore.instance.collection(
            'pages').add(PageData);
      } else {
        if (kDebugMode) {
          print("Nenhum usuário autenticado.");
        }
      }
    }
  }


  // Editar uma página existente com o ID do usuário logado
  Future<void> editPageWithUserId(myPage page) async {
    final userId = await getUserId();
    if (userId != null) {
      final document = await FirebaseFirestore.instance
          .collection('pages')
          .where('id', isEqualTo: page.id)
          .get()
          .then((snapshot) => snapshot.docs.first);

      if (document != null) {
        FirebaseFirestore.instance.collection('pages').doc(document.id).set({
          'id': page.id,
          'content': page.content,
          'title': page.title,
          'turma': page.turma,
          'uid': userId,
          'searchableDocument': page.searchableDocument,
        });
      } else {
        print('Documento não encontrado.');
      }
    } else {
      if (kDebugMode) {
        print("Nenhum usuário autenticado.");
      }
    }
  }

  Future<void> deletePageById(myPage page) async {
    final userId = await getUserId();
    if (userId != null) {
      final query = FirebaseFirestore.instance
          .collection('pages')
          .where('id', isEqualTo: page.id);

      final snapshot = await query.get();
      if (snapshot.docs.isNotEmpty) {
        final pageReference = snapshot.docs.first.reference;
        await pageReference.delete();
      } else {
        print("Página não encontrada.");
      }
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
          id: data['id'],
          content: data['content'],
          title: data['title'],
          turma: data['turma'],
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
            return myPage.fromJson(data); // Não converte a data
          }).toList();
        });
      } else {
        // Retorna um Stream vazio caso não haja usuário logado.
        return Stream.value([]);
      }
    });
  }

  Future<String?> getExistingContentFromDocument(String? documentId) async {
    final collection = FirebaseFirestore.instance.collection('pages');
    final doc = await collection.doc(documentId).get();
    if (doc.exists) {
      final data = doc.data();
      return data?['content'] as String;
      print(documentId);
    }
    print(documentId);
    return null;
  }
}
