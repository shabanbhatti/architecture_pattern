sealed class NotepadState {
  const NotepadState();
}

class InitialNotepadState extends NotepadState {
  const InitialNotepadState();
}

class LoadingNotepadState extends NotepadState {
  const LoadingNotepadState();
}

class LoadedNotepadState extends NotepadState {
  const LoadedNotepadState();
}

class ErrorNotepadState extends NotepadState {
  final String message;
  const ErrorNotepadState({required this.message});
}
