import 'package:api_integration/core/errors/failures/failures.dart';
import 'package:api_integration/core/service/common_local_database_service.dart';
import 'package:api_integration/model/notes_model.dart';
import 'package:api_integration/repository/notepad_repository.dart';
import 'package:api_integration/service/notepad_service.dart';
import 'package:api_integration/view%20Model/notepad%20controller/notepad_states.dart';
import 'package:flutter_riverpod/legacy.dart';

final notepadProvider =
    StateNotifierProvider.autoDispose<_NotepadStateNotifier, NotepadState>((
      ref,
    ) {
      return _NotepadStateNotifier(
        notepadRepository: NotepadRepository(
          notepadService: NotepadService(
            localDatabaseService: CommonLocalDatabaseService(),
          ),
        ),
      );
    });

class _NotepadStateNotifier extends StateNotifier<NotepadState> {
  final NotepadRepository notepadRepository;
  _NotepadStateNotifier({required this.notepadRepository})
    : super(InitialNotepadState());

  Future<void> insertNote(NotesModel notesMode) async {
    try {
      state = LoadingNotepadState();
      await notepadRepository.addNote(notesMode);
      state = LoadedNotepadState();
    } on Failures catch (e) {
      state = ErrorNotepadState(message: e.message);
    }
  }
}
