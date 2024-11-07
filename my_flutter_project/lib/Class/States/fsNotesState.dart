class FsNotesState {
  final List<NotesDB> notes;

  FsNotesState({
    required this.notes
  });

  // A convenient method to create initial state
  factory FsNotesState.initial() => FsNotesState(
    notes: []
  );

  FsNotesState copyWith({
    List<UsersDB>? setNotes,
  }) => FsNotesState(
    notes: setNotes ?? notes
  );
}