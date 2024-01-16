import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.toogle});

  final VoidCallback toogle;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('Sign in '),
        elevation: 0,
        backgroundColor: Colors.brown[400],
        actions: [
          TextButton.icon(
            onPressed: widget.toogle,
            icon: const Icon(Icons.person),
            label: const Text('Register'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) =>
                    value == null ? 'Enter email adress' : null,
                onChanged: (value) {
                  email = value;
                  debugPrint(email);
                },
              ),
              TextFormField(
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  return value == null || value.length < 6
                      ? 'Enter 6 digits password'
                      : null;
                },
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    debugPrint(email);
                    debugPrint(password);
                    _authService.signInWithEmailandPassword(
                        email: email, password: password);
                  }
                },
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
