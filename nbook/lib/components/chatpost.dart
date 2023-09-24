import 'package:flutter/material.dart';

class ChatPost extends StatefulWidget {
  const ChatPost({super.key});

  @override
  State<ChatPost> createState() => _ChatPostState();
}

class _ChatPostState extends State<ChatPost> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(),
        ListTile(
          leading: ClipOval(
            child: Image(
              image: AssetImage("assets/Dncing.jpeg"),
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
          ),
          title: Text("Dancing Club"),
          trailing: Icon(Icons.chat),
          onTap: null,
        ),
      ],
    );
  }
}
