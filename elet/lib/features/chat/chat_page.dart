import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample conversation data
    final List<Map<String, String>> conversations = [
      {
        'profilePic': 'assets/profile1.jpg',
        'name': 'Hili Tesfaye',
        'message': 'Hey, how are you?',
        'time': '2:30 PM',
      },
       {
        'profilePic': 'assets/profile1.jpg',
        'name': 'Hili Tesfaye',
        'message': 'Hey, how are you?',
        'time': '2:30 PM',
      },
       {
        'profilePic': 'assets/profile1.jpg',
        'name': 'Hili Tesfaye',
        'message': 'Hey, how are you?',
        'time': '2:30 PM',
      },
       {
        'profilePic': 'assets/profile1.jpg',
        'name': 'Hili Tesfaye',
        'message': 'Hey, how are you?',
        'time': '2:30 PM',
      },
      {
        'profilePic': 'assets/profile2.jpg',
        'name': 'Jane Smith',
        'message': 'Can we schedule a meeting?',
        'time': '1:15 PM',
      },
      {
        'profilePic': 'assets/profile3.jpg',
        'name': 'John Doe',
        'message': 'Looking forward to our project!',
        'time': 'Yesterday',
      },
       {
        'profilePic': 'assets/profile3.jpg',
        'name': 'John Doe',
        'message': 'Looking forward to our project!',
        'time': 'Yesterday',
      },
       {
        'profilePic': 'assets/profile3.jpg',
        'name': 'John Doe',
        'message': 'Looking forward to our project!',
        'time': 'Yesterday',
      },
      // A
      //dd more conversations as needed...
    ];

    return Scaffold(
       backgroundColor:Color(0xFF0D2243),
      appBar: AppBar(
          iconTheme: const IconThemeData(
          color: Colors.white, // Change the back icon color to pink
        ),
        title: const Text('Messages',style: TextStyle(color: Color(0xFF04FAA0),fontWeight: FontWeight.bold),),
        backgroundColor:Color(0xFF0D2243),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          final conversation = conversations[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(conversation['profilePic']!),
              radius: 25,
            ),
            title: Text(
              conversation['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(207, 255, 255, 255)),
            ),
            subtitle: Text(conversation['message']!),
            trailing: Text(
              conversation['time']!,
              style: const TextStyle(color: Color.fromARGB(209, 255, 255, 255)),
            ),
            onTap: () {
              // Navigate to chat detail when a conversation is tapped
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(conversation['name']!, conversation['profilePic']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

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
