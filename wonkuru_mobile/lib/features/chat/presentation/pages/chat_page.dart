import 'package:flutter/material.dart';
import 'package:let/features/chat/presentation/widgets/chat_detail_screen.dart';

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

