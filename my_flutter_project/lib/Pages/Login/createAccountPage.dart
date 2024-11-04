import 'package:flutter/material.dart';

import '../GenericWidget/appBarWidget.dart';
import '../GenericWidget/textBoxWidget.dart';

class MyCreateAccountPage extends StatefulWidget {
  const MyCreateAccountPage({super.key});

  @override
  State<MyCreateAccountPage> createState() => _MyCreateAccountPageState();
}

class _MyCreateAccountPageState extends State<MyCreateAccountPage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Create Account",
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: accountCreationBody(),
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

  Widget accountCreationBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            TextBoxWidget(
              headerText: "Full Name",
              hintText: "Jerald",
              controller: _nameController,
            ),
            const TextBoxWidget(
              headerText: "Password",
              obscureText: true,
            ),
            const TextBoxWidget(
              headerText: "Email",
              hintText: "Example@gmail.com",
            ),
            const TextBoxWidget(
              headerText: "Number",
              hintText: "+65",
            ),
            const SizedBox(height: 10),
            FractionallySizedBox(
              widthFactor: 0.4,
              child: clickableButton("Create", () {
                print(_nameController.text);
              }),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 200, right: 200),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: FractionallySizedBox(
            //           widthFactor: 0.5,
            //           child: clickableButton("Create", () {
            //             //Do something
            //           }),
            //         ),
            //       ),
            //       Expanded(
            //         child: FractionallySizedBox(
            //           widthFactor: 0.5,
            //           child: clickableButton("Another Button", () {
            //             // Do something else
            //           }),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


