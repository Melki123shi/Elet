
import 'package:flutter/material.dart';
import 'package:let/features/chat/presentation/widgets/chat_bubble.dart';

class ChatDetailScreen extends StatelessWidget {
  final String name;
  final String profilePic;

  const ChatDetailScreen(this.name, this.profilePic, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profilePic),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Text(name),
          ],
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                // Sample messages, add your own logic to load messages
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    message: 'Hi there!',
                    isMe: false,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    message: 'Hello! How can I help you?',
                    isMe: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    message: 'I wanted to discuss the project details.',
                    isMe: false,
                  ),
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blueAccent),
            onPressed: () {
              // Handle sending message
            },
          ),
        ],
      ),
    );
  }
}
