import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({super.key});
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
      border: Border(
          left: BorderSide.none,
          right: BorderSide.none,
          top: BorderSide(color: Colors.black),
          bottom: BorderSide(color: Colors.black)),
      color: Colors.white,
    ),
padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/User.jpg",
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              )])
  }




