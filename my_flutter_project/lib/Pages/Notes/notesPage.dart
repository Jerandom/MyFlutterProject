import 'package:flutter/material.dart';

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
            backgroundColor: Theme.of(context).colorScheme.background,
            floatingActionButton: FloatingActionButton(
                onPressed: createNote,
                child: const Icon(Icons.add),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    // Heading
                    Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text("Notes",
                            style: GoggleFonts.dmserifText(
                                fontSize: 48,
                                color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                        ),
                    ),

                    // List of Notes
                    Expanded(
                        child: ListView.builder(
                            item.Count: fsUsers.length,
                            itemBuilder: (context, index){

                                //get indeividual note
                                final note = fsUsers[index];

                                //list tile uI
                                return NoteTile(text: note.text);

                            },
                        ),
                    ),
                ],
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
                            ref.read(fsUsersProvider.notifier).addUser(_textController.text);

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