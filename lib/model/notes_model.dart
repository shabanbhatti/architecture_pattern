class NotesModel {
  final String title;
  final String describtion;
  final String createdAt;
  final int id;
  
  const NotesModel({
    required this.createdAt,
    required this.describtion,
    required this.id,
    required this.title,
  });

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      createdAt: map[createdAtCol],
      describtion: map[describtionCol],
      id: map[idCol],
      title: map[titleCol],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      titleCol: title,
      createdAtCol: createdAt,
      idCol: id,
      describtionCol: describtion,
    };
  }

  static const String tableName = "notepad_table";
  static const String createdAtCol = "created_at_col";
  static const String titleCol = "title_col";
  static const String describtionCol = "describtion_col";
  static const String idCol = "id_col";

  static const String createTable =
      '''
CREATE TABLE $tableName(
$titleCol TEXT,
$createdAtCol TEXT,
$describtionCol TEXT,
$idCol INTEGER PRIMARY KEY
)
''';
}


