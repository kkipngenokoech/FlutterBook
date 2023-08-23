class NoteModel {
  final int id;
  final String title;
  final String content;
  final String color;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.color,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map["id"] ?? 0, // Default value is provided if 'id' is missing
      title: map["title"] ?? "",
      content: map["content"] ?? "",
      color: map["color"] ?? "",
    );
  }
}
