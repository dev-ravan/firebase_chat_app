import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // Instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Instance of store
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

  // User login
  Future<UserCredential> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      // Login
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // add a new document for user collection if user doesn't exist
      _firebaseStore.collection("users").doc(userCredential.user!.uid).set({
        "uuid": userCredential.user!.uid,
        "email": userCredential.user!.email
      }, SetOptions(merge: true));

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

      // After creating the user create a document for user
      _firebaseStore.collection("users").doc(userCredential.user!.uid).set({
        "uuid": userCredential.user!.uid,
        "email": userCredential.user!.email
      });

      return userCredential;
    }
    // catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
