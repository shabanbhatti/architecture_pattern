import 'package:api_integration/core/errors/failures/failures.dart';
import 'package:api_integration/model/notes_model.dart';
import 'package:api_integration/service/notepad_service.dart';
import 'package:sqflite/sqflite.dart';

class NotepadRepository {
  final NotepadService notepadService;
  const NotepadRepository({required this.notepadService});

  Future<bool> addNote(NotesModel notesModel) async {
    try {
      return await notepadService.addNote(notesModel);
    } on DatabaseException catch (e) {
      throw DatabaseFailure(message: e.toString());
    }
  }

  Future<List<NotesModel>> getNotes() async {
    try {
      return await notepadService.getNotes();
    } on DatabaseException catch (e) {
      throw DatabaseFailure(message: e.toString());
    }
  }
}
