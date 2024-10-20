// import 'package:flutter/material.dart';
//
// class MyNotesPage extends StatefulWidget {
//   const MyNotesPage({super.key});
//
//   @override
//   State<MyNotesPage> createState() => _MyNotesPageState();
// }
//
// class _MyNotesPageState extends State<MyNotesPage> {
//
//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             backgroundColor: Theme.of(context).colorScheme.background,
//             floatingActionButton: FloatingActionButton(
//                 onPressed: createNote,
//                 child: const Icon(Icons.add),
//             ),
//             body: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                     // Heading
//                     Padding(
//                         padding: EdgeInsets.only(left: 25.0),
//                         child: Text("Notes",
//                             style: GoggleFonts.dmserifText(
//                                 fontSize: 48,
//                                 color: Theme.of(context).colorScheme.inversePrimary,
//                             ),
//                         ),
//                     ),
//
//                     // List of Notes
//                     Expanded(
//                         child: ListView.builder(
//                             item.Count: currentNotes.length,
//                             itemBuilder: (context, index){
//
//                                 //get indeividual note
//                                 final note = currentNotes[index];
//
//                                 //list tile uI
//                                 return NoteTile(text: note.text);
//
//                             },
//                         ),
//                     ),
//                 ],
//             ),
//         );
//     }
// }