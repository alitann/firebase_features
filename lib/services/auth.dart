import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInAnonymously() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      return result.user;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
