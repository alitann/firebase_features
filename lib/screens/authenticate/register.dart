import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.toogle});

  final VoidCallback toogle;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String password = '';

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('Register'),
        elevation: 0,
        backgroundColor: Colors.brown[400],
        actions: [
          TextButton.icon(
            onPressed: widget.toogle,
            icon: const Icon(Icons.person),
            label: const Text('Sign in'),
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
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  return value == null || value.length < 6
                      ? 'Enter 6 digits password'
                      : null;
                },
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    debugPrint(email);
                    debugPrint(password);
                    _authService.registerWithEmailandPassword(
                        email: email, password: password);
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
