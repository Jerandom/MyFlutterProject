import '../Firebase/notesDB.dart';

class FsNotesState {
  final Map<String, NotesDB> notes;

  FsNotesState({
    required this.notes,
  });

  // A convenient method to create initial state
  factory FsNotesState.initial() => FsNotesState(
    notes: {},
  );

  // Method to create a copy of the state with some fields replaced
  FsNotesState copyWith({
    Map<String, NotesDB>? setNotes,
  }) => FsNotesState(
    notes: setNotes ?? notes
  );
}