import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Firebase/notesDB.dart';
import '../States/fsNotesState.dart';

const String NOTE_COLLECTION_REF = "notes";

class FsNotesProvider extends StateNotifier<FsNotesState> {
  //create an instance of firestore
  final _fireStore = FirebaseFirestore.instance;
  late final CollectionReference _noteRef;

  FsNotesProvider() : super(FsNotesState.initial()) {
    // constructor
    _initNoteRef();
    _listenToRefChange();
  }

  // initialize ref to follow a structure
  void _initNoteRef() {
    _noteRef = _fireStore.collection(NOTE_COLLECTION_REF).withConverter<NotesDB>(
          fromFirestore: (snapshots, _) => NotesDB.fromJson(snapshots.data()!),
          toFirestore: (notesDB, _) => notesDB.toJson(),
        );
  }

  // listener to watch Firestore changes
  void _listenToRefChange() {
    _noteRef.snapshots().listen((QuerySnapshot<Object?> snapshot){
      final NotesDB notes = snapshot.docs.map((doc) => doc.data()).toList();

      // Update the state with the new list of notes
      state = state.copyWith(notes: notes);
    });
  }

  // Method to add data to Firestore
  Future<void> addNote(String note) async {
    final newNote = NotesDB(
      task: note,
      isDone: false,
      createdOn: Timestamp.now(),
      updatedOn: Timestamp.now(),
    );

    await _noteRef.add(newNote.toJson());
  }
}

// Define a provider for the FsNotesProvider
final fsNotesProvider = StateNotifierProvider<FsNotesProvider, FsNotesState>((ref) {
  return FsNotesProvider();
});