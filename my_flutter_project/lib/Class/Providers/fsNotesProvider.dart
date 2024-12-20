import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Firebase/notesDB.dart';
import '../States/fsNotesState.dart';

const String NOTE_COLLECTION_REF = "notes";

class FsNotesProvider extends StateNotifier<FsNotesState> {
  //create an instance of fire store
  final _fireStore = FirebaseFirestore.instance;
  late final CollectionReference _noteRef;

  FsNotesProvider() : super(FsNotesState.initial()) {
    // constructor
    _initNoteRef();
    _listenToRefChange();
  }

  // initialize fire store
  void _initNoteRef() {
    _noteRef = _fireStore.collection(NOTE_COLLECTION_REF);
  }

  // listener to watch Fire store changes
  void _listenToRefChange() {
    _noteRef.snapshots().listen((QuerySnapshot<Object?> snapshot) {
      final Map<String, NotesDB> newNotes = {
        for (var doc in snapshot.docs)
          doc.id: NotesDB.fromJson(doc.data() as Map<String, dynamic>)
      };

      // Update the state with the new map of notes
      state = state.copyWith(setNotes: newNotes);

      print(newNotes);
    });
  }

  // Method to add data to Fire store
  Future<void> addNote(String note) async {
    final NotesDB newNote = NotesDB(
      task: note,
      isDone: false,
      createdOn: Timestamp.now().toDate(),
      updatedOn: Timestamp.now().toDate(),
    );

    await _noteRef.add(newNote.toJson());
  }

  // Edit data given with doc Id
  Future<void> editNote(String docID, String newNote){
    return _noteRef.doc(docID).update({
      'task': newNote,
      'updatedOn': Timestamp.now(),
    });
  }

  // Update note status with given with doc Id
  Future<void> updateNoteStatus(String docID, bool newStatus){
    return _noteRef.doc(docID).update({
      'isDone': newStatus,
      'updatedOn': Timestamp.now(),
    });
  }

  Future<void> deleteNote(String docID){
    return _noteRef.doc(docID).delete();
  }
}

// Define a provider for the FsNotesProvider
final fsNotesProvider = StateNotifierProvider<FsNotesProvider, FsNotesState>((ref) {
  return FsNotesProvider();
});