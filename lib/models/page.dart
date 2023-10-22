class Note {
  final String document;
  late final String title;
  late final String turma;
  final DateTime date;
  final String uid;
  final String
      searchableDocument; //This was originally created to allow search function
  Note(
      {required this.document,
      required this.searchableDocument,
      required this.title,
      required this.turma,
      required this.date,
      required this.uid});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'turma': turma,
      'date': date,
      'uid': uid,
      'document': document,
      'searchableDocument': searchableDocument,
    };
  }
}
