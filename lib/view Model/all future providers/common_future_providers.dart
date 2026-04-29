import 'package:api_integration/core/service/common_local_database_service.dart';
import 'package:api_integration/model/notes_model.dart';
import 'package:api_integration/repository/notepad_repository.dart';
import 'package:api_integration/service/notepad_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CommonFutureProviders {
  var getNotes = FutureProvider<List<NotesModel>>((ref) {
    var repo = NotepadRepository(
      notepadService: NotepadService(
        localDatabaseService: CommonLocalDatabaseService(),
      ),
    );

    return repo.getNotes();
  });
}
