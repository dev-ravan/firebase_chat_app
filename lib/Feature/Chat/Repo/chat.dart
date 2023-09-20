import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/Models/message.dart';

class ChatService extends ChangeNotifier {
  // Get instance of auth and fire store
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

  // SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
    // Get current user info
    final currentUserId = _firebaseAuth.currentUser!.uid;
    final currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final timeStamp = Timestamp.now();

    // Create a new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timeStamp: timeStamp);

    // Construct chat room id from current user
    List<String> ids = [receiverId, currentUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // Add new message to database
    await _firebaseStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // GET MESSAGE
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // Construct the chat room id using the current user id and other user id
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firebaseStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timeStamp", descending: false)
        .snapshots();
  }
}
