import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTestPage extends ConsumerStatefulWidget {
  const MyTestPage({super.key});

  @override
  ConsumerState<MyTestPage> createState() => _MyTestPageState();
}

class _MyTestPageState extends ConsumerState<MyTestPage> {
  @override
  Widget build(BuildContext context) {
    final fsNotes = ref.watch(fsNotesProvider);

    return Scaffold(
        body: _buildUI();
    );
  }

  Widget _buildUI() {
    return SafeArea(
        child: Column(
            children: [
                _messageListView(),
            ],
        ));
  }

  Widget _messageListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: 
        builder: (context, snapshot) {

          // add the snapshot data to a list
          List noteList = snapshot.data?.docs ?? [];
          if(noteList.isEmpty){
            return const Center(
              child: Text("Add a Note"),
            );
          }

          return ListView.Builder(
            itemCount: 5,
            itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListTile(
                title: Text(fsNotes.task),
              ),
            ),
          });
        },
      ),
    );
  }
}