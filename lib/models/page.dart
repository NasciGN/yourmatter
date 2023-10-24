class myPage {
  final String id;
  final String content;
  final String title;
  final String turma;
  final String uid;
  final String searchableDocument;
  final List bgColor;
  final List borderColor;
  myPage(
      {required this.id,
      required this.content,
      required this.searchableDocument,
      required this.title,
      required this.turma,
      required this.uid,
      required this.bgColor,
      required this.borderColor});

  factory myPage.fromJson(Map<String, dynamic> json) {
    return myPage(
        id: json['id'],
        uid: json['uid'],
        title: json['title'],
        content: json['content'],
        turma: json['turma'],
        searchableDocument: json['searchableDocument'],
        bgColor: json['bgColor'],
        borderColor: json['borderColor']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'turma': turma,
      'uid': uid,
      'content': content,
      'searchableDocument': searchableDocument,
      'bgColor': bgColor,
      'borderColor': borderColor
    };
  }
}
