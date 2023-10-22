import 'package:cloud_firestore/cloud_firestore.dart';

class myPage {
  final String content;
  final String title;
  final String turma;
  final DateTime date;
  final String uid;
  final String
      searchableDocument; //This was originally created to allow search function
  myPage(
      {required this.content,
      required this.searchableDocument,
      required this.title,
      required this.turma,
      required this.date,
      required this.uid});

  factory myPage.fromJson(Map<String, dynamic> json) {
    final dateTimestamp = json['date'] as Timestamp;
    final date = dateTimestamp.toDate();

    return myPage(
      uid: json['uid'],
      title: json['title'],
      content: json['content'],
      turma: json['turma'],
      date: date,
      searchableDocument: json['searchableDocument'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'turma': turma,
      'date': Timestamp.fromDate(date),
      'uid': uid,
      'content': content,
      'searchableDocument': searchableDocument,
    };
  }
}
