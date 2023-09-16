import 'package:flutter/material.dart';

class Chatpost extends StatefulWidget {
  const Chatpost({super.key});

  @override
  State<Chatpost> createState() => _ChatpostState();
}

class _ChatpostState extends State<Chatpost> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
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
     
