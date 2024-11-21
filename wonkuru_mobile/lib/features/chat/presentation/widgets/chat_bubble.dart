import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({required this.message, required this.isMe, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isMe ? Colors.blueAccent : Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isMe ? 15.0 : 0),
          topRight: Radius.circular(isMe ? 0 : 15.0),
          bottomLeft: const Radius.circular(15.0),
          bottomRight: const Radius.circular(15.0),
        ),
      ),
      child: Text(
        message,
        style: TextStyle(color: isMe ? Colors.white : Colors.black),
      ),
    );
  }
}
