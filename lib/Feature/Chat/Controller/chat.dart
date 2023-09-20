import 'package:flutter/material.dart';
import 'package:my_chat_app/Feature/Chat/Repo/chat.dart';

class ChatProvider extends ChangeNotifier {
//  chat service
  final chatService = ChatService();

// Message text controller
  final messageController = TextEditingController();

// Send message
  sendMessage({required String receiverId, required String message}) async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(receiverId, message);
      // Clear the message controller after sending the message
      messageController.clear();
    }
  }
}
