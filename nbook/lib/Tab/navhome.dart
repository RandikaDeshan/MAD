import 'package:flutter/material.dart';
import 'package:nbook/Screens/login.dart';
import 'package:nbook/Screens/search.dart';
import '../Screens/home2.dart';
import '../Screens/notification.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("TRD Peiris"),
            accountEmail: const Text("trdpeiris@students.nsbm.ac.lk"),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    child: Image.asset(
              "assets/randi.jpg",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ))),
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Home2())),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => const NotificationPage())),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text("Search"),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SearchPage())),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage())),
          ),
        ],
      ),
    );
  }
}
