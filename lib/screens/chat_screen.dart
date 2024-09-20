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
              username: 'Jeanine Uwase',
              message: 'Hey, how are you?',
              time: '2m ago',
              isUnread: true,
              profileImage: 'assets/images/person1.png',
            ),
            ChatItem(
              username: 'Alice Umutoni',
              message: 'The meeting is tomorrow at 3PM.',
              time: '5m ago',
              isUnread: false, 
              profileImage: 'assets/images/person2.png',
            ),
            ChatItem(
              username: 'Tuyizere JB',
              message: 'Can you share the report?',
              time: '10m ago',
              isUnread: true, 
              profileImage: 'assets/images/person3.png',
            ),
            ChatItem(
              username: 'Aimee Ishimwe',
              message: 'Thanks for the help!',
              time: '1h ago',
              isUnread: false, 
              profileImage: 'assets/images/person4.png',
            ),
            ChatItem(
              username: 'Sarah Kabera',
              message: 'I’ve completed the task you assigned.',
              time: '2h ago',
              isUnread: true,
              profileImage: 'assets/images/person5.png',
            ),
            ChatItem(
              username: 'Rugarama Jacque',
              message: 'Can we reschedule the meeting?',
              time: '3h ago',
              isUnread: true,
              profileImage: 'assets/images/person2.png',
            ),
            ChatItem(
              username: 'Ineza Rachel',
              message: 'Looking forward to the event!',
              time: '5h ago',
              isUnread: false,
              profileImage: 'assets/images/person1.png',
            ),
            ChatItem(
              username: 'Mark Kabera',
              message: 'I will call you later.',
              time: 'Yesterday',
              isUnread: false,
              profileImage: 'assets/images/person3.png',
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
        
      },
    );
  }
}
