import 'package:api_integration/core/service/common_local_database_service.dart';
import 'package:api_integration/model/notes_model.dart';

class NotepadService {
  final CommonLocalDatabaseService localDatabaseService;
  const NotepadService({required this.localDatabaseService});

  Future<bool> addNote(NotesModel notesModel) async {
    var db = await localDatabaseService.getDatabase;
    var isInserted = await db.insert(NotesModel.tableName, notesModel.toMap());
    return isInserted > 0;
  }

  Future<List<NotesModel>> getNotes() async {
    var db = await localDatabaseService.getDatabase;
    var data = await db.query(NotesModel.tableName);
    return data.map((index) {
      return NotesModel.fromMap(index);
    }).toList();
  }
}
