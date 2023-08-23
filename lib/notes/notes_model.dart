class NoteModel {
  final String id;
  final String title;
  final String content;
  final String color;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.color,
  });

  factory NoteModel.fromMap( String id, Map<String, dynamic> map) {
    return NoteModel(
      id: id,
      title: map["title"] ?? "",
      content: map["content"] ?? "",
      color: map["color"] ?? "",
    );
  }
}
