import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/fsNotesProvider.dart';
import '../GenericWidget/textBoxWidget.dart';

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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: fsNotes.length,
            itemBuilder: (context, index) {
              final note = fsNotes[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Created on: ${note.createdOn}",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Updated on: ${note.updatedOn}",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: note.isCompleted,
                            onChanged: (bool? value) {
                              ref.read(fsNotesProvider.notifier).toggleNoteCompletion(note.id, value ?? false);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Add your edit functionality here
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              ref.read(fsNotesProvider.notifier).deleteNote(note.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
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
