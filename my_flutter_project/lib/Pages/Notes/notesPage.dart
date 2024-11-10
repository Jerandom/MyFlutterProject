import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/fsNotesProvider.dart';
import '../GenericWidget/textBoxWidget.dart';

class MyNotesPage extends ConsumerStatefulWidget {

    const MyNotesPage({
        super.key
    });

    @override
    ConsumerState<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends ConsumerState<MyNotesPage> {
    final TextEditingController _textController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final fsNotes = ref.watch(fsNotesProvider);

        return Scaffold(
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
                    controller: _textController
                ),
                actions: [
                    ElevatedButton(
                        onPressed: () {
                            //add a new note
                            ref.read(fsNotesProvider.notifier).addNote(_textController.text);

                            //clear text controller
                            _textController.clear();

                            //close the dialog
                            Navigator.pop(context);
                        },
                        child: const Text("Add"),
                    ),
                ],
            ),
        );
    }
}