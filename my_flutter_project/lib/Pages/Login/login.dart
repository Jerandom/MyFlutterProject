import 'package:flutter/material.dart';

import '../../Class/GenericProvider/appState.dart';
import '../../Class/widgetClass/GenericWidget/buttonWidget.dart';
import '../../Class/widgetClass/GenericWidget/slidePageWidget.dart';
import '../../Class/widgetClass/GenericWidget/textBoxWidget.dart';
import '../../Class/widgetClass/GenericWidget/iconButtonWidget.dart';
import 'createAccount.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLoginPage extends ConsumerStatefulWidget {
  const MyLoginPage({super.key});

  @override
  ConsumerState<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends ConsumerState<MyLoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appStateProvider);

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
                Image.asset(
                  'assets/images/ic_launcher.png',
                  width: 120,
                  height: 120,
                ),

                SizedBox(height: 50),

                //Title Message
                Text(
                  "Welcome to My Flutter Project",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 25),

                //username textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextBoxWidget(
                    headerText: "",
                    hintText: "Email",
                    controller: _usernameController,
                    bTextDisplay: false,
                    height: 60,
                  ),
                ),

                SizedBox(height: 10),

                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextBoxWidget(
                    headerText: "",
                    hintText: "Password",
                    obscureText: true,
                    controller: _passwordController,
                    bTextDisplay: false,
                    height: 60,
                  ),
                ),

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ButtonWidget(
                    title: "Sign In",
                    onTap: (() {
                      Navigator.pushNamed(context,  "/imageList");
                    }),
                  ),
                ),

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
                    IconButtonWidget(
                      title: "Google",
                      imagePath: 'assets/images/google_icon.png',
                    ),

                    SizedBox(width: 25),

                    //apple button
                    IconButtonWidget(
                      title: "Apple",
                      imagePath: 'assets/images/google_icon.png',
                    ),
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

    // return Scaffold(
    //     appBar: const AppBarWidget(
    //     title: "Login Page",
    //     ),
    //    body: loginBody(),
    // );
  }
}