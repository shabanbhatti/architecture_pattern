import 'package:api_integration/core/service/local_database_service.dart';
import 'package:api_integration/model/notes_model.dart';

class NotepadDbService {
  final LocalDatabaseService localDatabaseService;
  const NotepadDbService({required this.localDatabaseService});

  Future<bool> addNote(NotesModel notesModel) async {
    var db = await localDatabaseService.getDatabase;
    var isInserted = await db.insert(NotesModel.tableName, notesModel.toMap());
    return isInserted > 0;
  }

  Future<List<NotesModel>> getNotes() async {
    var db = await localDatabaseService.getDatabase;
    var data = await db.query(NotesModel.tableName);
    // return data.map((index) {
    //   return NotesModel.fromMap(index);
    // }).toList();

    for (var element in collection) {
      
    }
  }
}


