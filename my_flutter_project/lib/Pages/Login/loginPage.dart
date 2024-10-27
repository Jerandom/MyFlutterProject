import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/appProvider.dart';

import '../GenericWidget/buttonWidget.dart';
import '../GenericWidget/clickableTextWidget.dart';
import '../GenericWidget/flipPageWidget.dart';
import '../GenericWidget/iconButtonWidget.dart';
import '../GenericWidget/textBoxWidget.dart';
import 'createAccountPage.dart';

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
    final appState = ref.watch(appProvider);

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
                        ClickableTextWidget(
                          title: "Forgot Password?",
                          color: Colors.grey.shade600,
                          onTap: () {
                            Navigator.push(context, FlipPageRoute(widget: MyCreateAccountPage()));
                          },
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

                  // not a member? register now
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
  }
}