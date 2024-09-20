import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: const Color(0xFF7980FF),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            ChatItem(
              username: 'John Doe',
              message: 'Hey, how are you?',
              time: '2m ago',
              isUnread: true, // Unanswered message
              profileImage: 'assets/images/person1.png',
            ),
            ChatItem(
              username: 'Alice Watson',
              message: 'The meeting is tomorrow at 3PM.',
              time: '5m ago',
              isUnread: false, // Opened message
              profileImage: 'assets/images/person2.png',
            ),
            ChatItem(
              username: 'Michael Johnson',
              message: 'Can you share the report?',
              time: '10m ago',
              isUnread: true, // Unanswered message
              profileImage: 'assets/images/person3.png',
            ),
            ChatItem(
              username: 'Emily Clark',
              message: 'Thanks for the help!',
              time: '1h ago',
              isUnread: false, // Opened message
              profileImage: 'assets/images/profile4.png',
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String username;
  final String message;
  final String time;
  final bool isUnread;
  final String profileImage;

  const ChatItem({
    required this.username,
    required this.message,
    required this.time,
    required this.isUnread,
    required this.profileImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(profileImage),
        radius: 30,
      ),
      title: Text(
        username,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: const TextStyle(color: Colors.grey)),
          if (isUnread)
            const Icon(Icons.circle, color: Color(0xFF7980FF), size: 12), 
        ],
      ),
      onTap: () {
        // Navigate to the specific chat screen
      },
    );
  }
}
