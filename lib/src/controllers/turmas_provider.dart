import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:your_matter/src/controllers/resources/auth.dart';

final turmasProvider = StreamProvider((ref) =>
    FirebaseFirestore.instance.collection(userId!).doc('turmas').snapshots());
