import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nbook/Screens/home2.dart';
import 'package:nbook/Screens/search.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    //model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
        body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .where('role', isGreaterThanOrEqualTo: 'admin')
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Home2();
              }
              return SearchPage();
            }));
  }
}
