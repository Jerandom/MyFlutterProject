import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/appProvider.dart';
import '../../Class/Providers/fsUserAccountProvicer.dart';
import '../GenericWidget/buttonWidget.dart';
import '../GenericWidget/clickableTextWidget.dart';
import '../GenericWidget/iconButtonWidget.dart';
import '../GenericWidget/slidePageWidget.dart';
import 'createAccountPage.dart';

class MyLoginPage extends ConsumerStatefulWidget {
  const MyLoginPage({super.key});

  @override
  ConsumerState<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends ConsumerState<MyLoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appProvider);
    final fsUserAccState = ref.watch(fsUserAccountProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),

                  // Logo
                  Image.asset(
                    'assets/images/ic_launcher.png',
                    width: 120,
                    height: 120,
                  ),

                  SizedBox(height: 50),

                  // Title Message
                  Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height: 25),

                  // Email TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Example@gmail.com",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                      validator: validateEmail,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Password TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                      validator: validatePassword,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Forgot Password
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClickableTextWidget(
                          title: "Forgot Password?",
                          color: Colors.grey.shade600,
                          onTap: () {
                            // Handle forgot password logic
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  // Sign In Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonWidget(
                      title: "Sign In",
                      onTap: () {
                        if (_formKey.currentState?.validate() == true) {
                          // Update the provider
                          ref.read(appProvider.notifier).setLoginState(true);

                          // Navigate to the home page
                          context.go('/home');
                        }
                      },
                    ),
                  ),

                  SizedBox(height: 50),

                  // Or continue with
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

                  // Google + Apple sign-in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google button
                      IconButtonWidget(
                        title: "Google",
                        imagePath: 'assets/images/google_icon.png',
                        onPressed: () {
                          // function for google sign in
                          ref.read(fsUserAccountProvider.notifier).signInWithGoogle();
                        },
                      ),

                      SizedBox(width: 25),

                      // Apple button
                      IconButtonWidget(
                        title: "Apple",
                        imagePath: 'assets/images/apple_icon.png',
                        onPressed: () {
                          // function for apple sign in

                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 50),

                  // Not a member? Register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(width: 4),
                      ClickableTextWidget(
                        title: " Sign Up",
                        color: Colors.blue,
                        onTap: () {
                          Navigator.push(context,SlidePageRoute(widget: MyCreateAccountPage()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
