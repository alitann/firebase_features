import 'package:firebase/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AppUser? userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> get appUser {
    return _firebaseAuth.authStateChanges().map(userFromFirebaseUser);
  }

  Future<AppUser?> signInWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userFromFirebaseUser(result.user);
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<AppUser?> registerWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userFromFirebaseUser(result.user);
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<AppUser?> signInAnonymously() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      return userFromFirebaseUser(result.user);
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
