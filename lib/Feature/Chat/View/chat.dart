import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/Feature/Chat/Controller/chat.dart';
import 'package:my_chat_app/Res/colors.dart';
import 'package:my_chat_app/Res/text_fields.dart';
import 'package:my_chat_app/Res/texts.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverUid;
  const ChatPage(
      {super.key, required this.receiverEmail, required this.receiverUid});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.black,
        centerTitle: true,
        title: MyTexts()
            .DMSansNormalWhiteText(text: widget.receiverEmail, size: 20),
      ),
      body: Consumer<ChatProvider>(
        builder: (context, snap, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(children: [
            Expanded(child: _buildMessageList()),
            MyTextFields().sendMessageField(
                controller: snap.messageController,
                onTap: () {
                  snap.sendMessage(
                      receiverId: widget.receiverUid,
                      message: snap.messageController.text);
                })
          ]),
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) => StreamBuilder(
        stream: chatProvider.chatService
            .getMessages(_firebaseAuth.currentUser!.uid, widget.receiverUid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error :${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading..."),
            );
          }
          return ListView(
            shrinkWrap: true,
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

// Alignment for current user and other user
    var alignment = data["senderId"] == _firebaseAuth.currentUser!.uid
        ? Alignment.topRight
        : Alignment.topLeft;

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Palette.grey),
      alignment: alignment,
      child: MyTexts().DMSansNormalBlackText(text: data["message"], size: 15),
    );
  }
}
