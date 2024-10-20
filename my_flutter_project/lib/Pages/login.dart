import 'package:flutter/material.dart';

import '../Class/GenericProvider/appState.dart';
import '../Class/widgetClass/appBarWidget.dart';
import '../Class/widgetClass/textBoxWidget.dart';
import '../Class/widgetClass/slidePageWidget.dart';

import 'createAccount.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLoginPage extends ConsumerStatefulWidget {
  const MyLoginPage({super.key});

  @override
  ConsumerState<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends ConsumerState<MyLoginPage> {

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

  Widget loginBody(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/icons/ic_launcher.png", height: 100, width: 100),
              ],
            ),
            const SizedBox(height: 80),
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
              widthFactor: 0.5,
              child: clickableButton("Login", () {
                Navigator.pushNamed(context,  "/imageList");
              }),
            ),
            const SizedBox(height: 16),
            clickableText("Create Account", () {
              Navigator.push(context, SlidePageRoute(widget: const MyCreateAccountPage()));
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appStateProvider);
    final connectionType = appState.connectionStatus;
    final platformMode = appState.platformMode;

    return Scaffold(
      //backgroundColor:
      body: SafeArea(
        child: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),

                //logo
                Icon(
                  Icons.lock,
                  size: 100,
                ),

                SizedBox(height: 50),

                //Title Message
                Text(
                  "Welcome to Login Page",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 25),

                //username textfield
                //TODO

                SizedBox(height: 10),

                //password textfield
                //TODO

                SizedBox(height: 10),

                //forgot password
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                //sign in button
                //TODO

                SizedBox(height: 50),

                //or continue with
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50),

                //google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    //SqareTile(imagePath: "TODO"),

                    SizedBox(width: 25),

                    //apple button
                    //SqareTile(imagePath: "TODO"),
                  ],
                ),

                SizedBox(height: 50),

                // not a memter? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),

                    SizedBox(width: 4),

                    Text("Register now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )

        ),
      ),
    );


    // return Scaffold(
    //     appBar: const AppBarWidget(
    //     title: "Login Page",
    //     ),
    //    body: loginBody(),
    // );
  }
}