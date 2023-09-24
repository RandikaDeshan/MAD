import 'package:flutter/material.dart';

class AdminAccPage extends StatefulWidget {
  const AdminAccPage({super.key});

  @override
  State<AdminAccPage> createState() => _AdminAccPageState();
}

class _AdminAccPageState extends State<AdminAccPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text("NBook"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
      ),
    );
  }
}
