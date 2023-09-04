import 'package:flutter/material.dart';
class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("NBook"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.chat))],
      ),
    );

      }
  }
