import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_project/Class/States/fsNotesState.dart';

import '../../Class/Providers/fsNotesProvider.dart';
import '../GenericWidget/textBoxWidget.dart';
import 'noteTileWidget.dart';

class MyNotesPage extends ConsumerStatefulWidget {
  const MyNotesPage({super.key});

  @override
  ConsumerState<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends ConsumerState<MyNotesPage> {
  final TextEditingController _addNoteController = TextEditingController();
  final TextEditingController _editNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fsNotes = ref.watch(fsNotesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text( "Notes"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: fsNotes.notes.isEmpty
              ? _emptyWidget(context)
              : _listWidget(context, fsNotes)),
      floatingActionButton: FloatingActionButton(
        onPressed: addNoteDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _emptyWidget(BuildContext context) => Center(
        child: Text("Notes is empty. Add a note!"),
      );

  Widget _listWidget(BuildContext context, FsNotesState fsNotes) =>
      ListView.builder(
        itemCount: fsNotes.notes.length,
        itemBuilder: (context, index) {
          // Getting the key-value pair at the current index
          final noteId = fsNotes.notes.entries.elementAt(index).key;
          final note = fsNotes.notes.entries.elementAt(index).value;

          // create the tiles for list view
          return NoteTileWidget(
            title: note.task,
            createdOn: note.createdOn.toString(),
            updatedOn: note.updatedOn.toString(),
            isDone: note.isDone,

            // when the task is done/undone
            onCheckboxChanged: (value) {
              ref.read(fsNotesProvider.notifier).updateNoteStatus(noteId, value!);
            },

            // edit the notes
            onEditPressed: () {
              editNoteDialog(noteId, note.task);
            },

            // delete the notes
            onDeletePressed: () {
              ref.read(fsNotesProvider.notifier).deleteNote(noteId);
            },
          );
        },
      );

  void addNoteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextBoxWidget(
          title: "Add Notes",
          hint: "Example",
          controller: _addNoteController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Add a new note
              ref.read(fsNotesProvider.notifier).addNote(_addNoteController.text);

              // Clear text controller
              _addNoteController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  void editNoteDialog(String noteId, String currentNoteText) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextBoxWidget(
          title: "Edit Notes",
          hint: "Example",
          controller: _editNoteController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Update the note with the new text
              ref.read(fsNotesProvider.notifier).editNote(noteId, _editNoteController.text);

              // Clear the text controller
              _editNoteController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
