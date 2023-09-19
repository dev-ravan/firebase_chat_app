import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // Instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // User login
  Future<UserCredential> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      // Login
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    }
    // catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Log out
  Future<void> logOut() async {
    return await _firebaseAuth.signOut();
  }

  // Create a new user
  Future<UserCredential> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      // Sign Up
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    }
    // catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
