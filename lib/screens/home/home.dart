import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('User'),
        elevation: 0,
        backgroundColor: Colors.brown[400],
        actions: [
          ElevatedButton(
            onPressed: () async {
              await _authService.signOut();
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
