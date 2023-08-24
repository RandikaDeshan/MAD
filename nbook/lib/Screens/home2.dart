import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(), //navigation bar
      appBar: AppBar(),
      body: ListView(children: const [
        Padding(padding: EdgeInsets.only(top: 20)),
        Post(),
        SizedBox(
          height: 20,
        ),
        Post(),
        SizedBox(
          height: 20,
        ),
        Post(),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
