import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../Class/Providers/appProvider.dart';
import '../../Class/Providers/fsUserAccountProvicer.dart';
import '../../Class/States/fsUserAccountState.dart';
import '../GenericWidget/buttonWidget.dart';
import '../GenericWidget/clickableTextWidget.dart';
import '../GenericWidget/snackBarWidget.dart';

class MyCreateAccountPage extends ConsumerWidget {
  const MyCreateAccountPage({super.key});

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

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value != password) {
      return 'Password does not match';
    }
    return null;
  }

  void setupFsUserAccountListener(BuildContext context, WidgetRef ref) {
    // Set up a persistent listener for the provider state
    ref.listen<FsUserAccountState>(fsUserAccountProvider, (previous, next) {
      if (next.errorMsg.isEmpty) {
        // Success return back to sign in
        Navigator.of(context).pop();
        SnackBarWidget(title: "Account Creation Successful").show(context);

      } else if (next.errorMsg.isNotEmpty) {
        // Show error if there was an issue
        SnackBarWidget(title: next.errorMsg).show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fsUserAccountState = ref.watch(fsUserAccountProvider);

    late TextEditingController emailController = TextEditingController();
    late TextEditingController passwordController = TextEditingController();
    late TextEditingController cfmPasswordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // Set up a persistent listener for the provider state
    setupFsUserAccountListener(context, ref);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  "Register Account",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 25),

                // Email TextFormField with validation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Example@gmail.com",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                    ),
                    validator: validateEmail,
                  ),
                ),

                const SizedBox(height: 10),

                // Password TextFormField with validation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                    ),
                    validator: validatePassword,
                  ),
                ),

                const SizedBox(height: 10),

                // Confirm Password TextFormField with validation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: cfmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                    ),
                    validator: (String? value) =>
                        validateConfirmPassword(value!, passwordController.text),
                  ),
                ),

                const SizedBox(height: 40),

                // Create Account Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ButtonWidget(
                    title: "Create Account",
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Handle account creation here
                        ref.read(fsUserAccountProvider.notifier).createUserWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                  ),
                ),

                SizedBox(height: 30),

                // Divider
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
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // already a member? Sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4),
                    ClickableTextWidget(
                      title: " Sign in",
                      color: Colors.blue,
                      onTap: () {
                        // return back to sign in
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
