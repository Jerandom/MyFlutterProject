// // Define a state notifier for managing the app state
// class NoteState {
//     final Isar isar;
//     final List<NoteObj> notes
//
//     NoteState({
//         required this.isar
//         required this.notes
//     });
//
//     // A convenient method to create initial state
//     factory NoteStare.initial() => NoteState(
//         isar: isar.initial,
//         notes: [],
//     );
//
//     // Method to create a copy of the state with some fields replaced
//     NoteState copyWith({
//         Isar? setIsar,
//         List<NoteObj>? setNotes,
//     }) => NoteState(
//         isar: setIsar ?? isar,
//         notes: setNotes ?? notes,
//     );
// }
//
// class NoteStateManager extends StateNotifier<NoteState> {
//   NoteStateManager() : super(NoteState.initial()) {
//     // Constructor
//   }
// }