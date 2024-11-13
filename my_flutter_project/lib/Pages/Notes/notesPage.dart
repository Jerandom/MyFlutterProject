import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/fsNotesProvider.dart';
import '../GenericWidget/textBoxWidget.dart';
import 'noteTileWidget.dart';

class MyNotesPage extends ConsumerStatefulWidget {
  const MyNotesPage({super.key});

  @override
  ConsumerState<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends ConsumerState<MyNotesPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fsNotes = ref.watch(fsNotesProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: fsNotes.notes.isEmpty ?
        Center(
          child: Text( "Notes is empty. Add a note!"),
        ) :
        ListView.builder(
          itemCount: fsNotes.notes.length,
          itemBuilder: (context, index) {
            // Getting the key-value pair at the current index
            final noteId = fsNotes.notes.entries.elementAt(index).key;
            final note = fsNotes.notes.entries.elementAt(index).value;

            // create the tiles for list view
            return NoteTileWidget(
              title: note.title,
              createdOn: note.createdOn.toString(),
              updatedOn: note.updatedOn.toString(),
              isDone: note.isDone,

              // when the task is done/undone
              onCheckboxChanged: () {

              },

              // edit the notes
              onEditPressed: () {
                 ref.read(fsNotesProvider.notifier).updateNote(noteId);
              },

              // delete the notes
              onDeletePressed: () {
                ref.read(fsNotesProvider.notifier).deleteNote(noteId);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNoteDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  void addNoteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextBoxWidget(
          headerText: "Add Notes",
          hintText: "Example",
          controller: _textController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Add a new note
              ref.read(fsNotesProvider.notifier).addNote(_textController.text);

              // Clear text controller
              _textController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
