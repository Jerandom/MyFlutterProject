import 'package:flutter/material.dart';

class MyCreateAccountPage extends StatefulWidget {
  const MyCreateAccountPage({super.key});

  @override
  State<MyCreateAccountPage> createState() => _MyCreateAccountPageState();
}

class _MyCreateAccountPageState extends State<MyCreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Page"),
      ),
      body: Center(
        child: Text("This is the Menu Page"),
      ),
    );
  }
}


