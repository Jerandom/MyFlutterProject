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
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return NoteTileWidget(
              title: "asd",
              createdOn: "November 7, 2024 at 3:18:40",
              updatedOn: "November 7, 2024 at 3:18:40",
              onEditPressed: () {

              },
              onDeletePressed: () {

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
