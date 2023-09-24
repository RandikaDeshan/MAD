import 'package:flutter/material.dart';

class Slist extends StatefulWidget {
  const Slist({super.key});

  @override
  State<Slist> createState() => _SlistState();
}

class _SlistState extends State<Slist> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(),
        ListTile(
          style: ListTileStyle.list,
          leading: ClipOval(
            child: Image(
              image: AssetImage("assets/Dncing.jpeg"),
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
          ),
          title: Text("Dancing Club"),
          trailing: Icon(Icons.account_circle),
          onTap: null,
        ),
      ],
    );
  }
}
