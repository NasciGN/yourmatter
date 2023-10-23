class myPage {
  final String id;
  final String content;
  final String title;
  final String turma;
  final String uid;
  final String
      searchableDocument; //This was originally created to allow search function
  myPage(
      {required this.id,
      required this.content,
      required this.searchableDocument,
      required this.title,
      required this.turma,
      required this.uid});

  factory myPage.fromJson(Map<String, dynamic> json) {
    return myPage(
      id: json['id'],
      uid: json['uid'],
      title: json['title'],
      content: json['content'],
      turma: json['turma'],
      searchableDocument: json['searchableDocument'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'turma': turma,
      'uid': uid,
      'content': content,
      'searchableDocument': searchableDocument,
    };
  }
}
