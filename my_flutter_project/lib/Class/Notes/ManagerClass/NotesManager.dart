//
// class NoteManager{
//     static late Isar isar
//     final List<Note> currentNotes
//
//     //initialize database
//     static Future<void> initialize() async {
//         final dir = await getApplicationDocumentsDirectory();
//         isar = await Isar.open(
//             [NoteSchema],
//             directoryy: dir.path,
//         );
//     }
//
//     //create - a note and save to db
//     Future<void> addNote(String userText) async {
//         //create a new note object
//         final newNote = Note()..text = textFromUser;
//
//         //save to db
//         await isar.writeTxn(() => isar.note.put(newNote));
//
//         //re-read from db
//         fetchNotes();
//     }
//
//     //read - notes from db
//     Future<void> fetchNotes() async {
//         List<Note> fetchNotes = await isar.notes.where().findAll();
//
//         currentNotes.clear();
//         currentNotes.addAll(fetchedNotes);
//     }
//
//     //update - note in db
//     Future<void> updateNote(int id, String newText) async {
//         final existingNote = await isar.notes.get(id);
//         if(existingNote != null) {
//             existingNote.text = newText;
//
//             await isar.writeTxn(() => isar.notes.put(existingNote));
//             await fetchNotes;
//         }
//     }
//
//     Future<void> deleteNote(int id) async {
//         await isar.writeTxn(() => isar.notes.delete(id));
//         await fetchNotes();
//     }
// }