import 'package:flutter/material.dart';
import 'package:nbook/Tab/navhome.dart';

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
      body:ListView(
        scrollDirection: Axis.vertical,
         children:const [
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.black,
              ),
        decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                filled: true,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                 Icons.search,
                 color: Colors.black,
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(37)),
                   ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
               
            
