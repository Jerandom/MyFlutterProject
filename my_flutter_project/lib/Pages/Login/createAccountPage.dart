import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCreateAccountPage extends ConsumerStatefulWidget {
  const MyCreateAccountPage({super.key});

  @override
  ConsumerState<MyCreateAccountPage> createState() =>
      _MyCreateAccountPageState();
}

class _MyCreateAccountPageState extends ConsumerState<MyCreateAccountPage> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: accountCreationBody(),
    );
  }

  Widget accountCreationBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Example@gmail.com",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              // Password TextFormField with validation
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Create Account Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Handle account creation here
                    }
                  },
                  child: const Text("Create Account"),
                ),
              ),

              SizedBox(height: 50),

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

              SizedBox(height: 50),

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
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
