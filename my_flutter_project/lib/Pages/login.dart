import 'package:flutter/material.dart';

import 'package:my_flutter_project/Class/widgetClass/appBarWidget.dart';
import 'package:my_flutter_project/Class/widgetClass/textBoxWidget.dart';
import 'package:my_flutter_project/Class/widgetClass/slidePageWidget.dart';
import 'package:my_flutter_project/Pages/home.dart';

import 'createAccount.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  GestureDetector clickableText(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  ElevatedButton clickableButton(String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Login Page",
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 300.0, right: 300.0, bottom: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TextBoxWidget(
                headerText: "Username",
                hintText: "Example@gmail.com",
                height: 100,
              ),
              const TextBoxWidget(
                headerText: "Password",
                obscureText: true,
                height: 100,
              ),
              FractionallySizedBox(
                widthFactor: 0.2,
                child: clickableButton("Login", () {
                  Navigator.pushReplacementNamed(context,  "/home");
                }),
              ),
              const SizedBox(height: 16),
              clickableText("Create Account", () {
                Navigator.push(context, SlidePageRoute(widget: const MyCreateAccountPage()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
