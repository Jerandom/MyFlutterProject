import 'package:flutter/material.dart';

import 'package:my_flutter_project/Class/widgetClass/appBarWidget.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Login Page",),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, "/home");
            },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
