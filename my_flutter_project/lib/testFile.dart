import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTestPage extends ConsumerStatefulWidget {
  final Widget child;

  const MyTestPage({super.key});

  @override
  ConsumerState<MyTestPage> createState() => _MyTestPageState();
}

class _MyTestPageState extends ConsumerState<MyTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: _buildUI();
        body: Center(child: Text("database ID"))
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
      
    );
  }
}