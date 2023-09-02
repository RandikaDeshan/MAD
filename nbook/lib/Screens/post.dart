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
                ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TRD Peiris",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ), 
                    Text(
                      "1day",
                      style: TextStyle(fontSize: 10, color: Colors.black),
                     ),
                  ],
                ),
              ),
            ],
          ),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.black),
          ),
          Image.asset(
            "Hagum.jpeg",
          ),
const Row(
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.favorite_border, color: Colors.black),
              ),
SizedBox(
                width: 5,
              ),
              Text(
                "25",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 10,
              ),

