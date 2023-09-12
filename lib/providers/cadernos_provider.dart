import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:your_matter/resources/auth.dart';

final cadernoProvider = StreamProvider((ref) => FirebaseFirestore.instance
    .collection(userId!)
    .orderBy('date', descending: true)
    .snapshots());
