import 'package:flutter/material.dart';
import 'package:nbook/Screens/home.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

const double leadingWidth = 500;

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: 100,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                "nbook.png",
                width: 500,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: Colors.black,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message,
                    color: Colors.black,
                  )),
            ],
            bottom: const TabBar(
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.group)),
                  Tab(icon: Icon(Icons.notifications)),
                  Tab(icon: Icon(Icons.settings)),
                  Tab(icon: Icon(Icons.account_circle)),
                ])),
        body: const TabBarView(children: [
          Home(),
          Icon(Icons.home),
          Icon(Icons.home),
          Icon(Icons.home),
          Icon(Icons.home),
        ]),
      ),
    );
  }
}
