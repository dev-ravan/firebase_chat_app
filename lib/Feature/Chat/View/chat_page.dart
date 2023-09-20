import 'package:flutter/material.dart';
import 'package:my_chat_app/Utils/app_bar.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverUid;
  const ChatPage(
      {super.key,
      required title,
      required this.receiverEmail,
      required this.receiverUid});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context, onTap: () {}),
    );
  }
}
