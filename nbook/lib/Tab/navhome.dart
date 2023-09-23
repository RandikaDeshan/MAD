import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nbook/Screens/adAc.dart';
import 'package:nbook/Screens/add_post.dart';
import 'package:nbook/Screens/home2.dart';
import 'package:nbook/Screens/loginpage.dart';
import 'package:nbook/Screens/search.dart';
import 'package:nbook/components/auth_methods.dart';
import 'package:nbook/components/user_provider.dart';
import 'package:nbook/model/user_model.dart' as model;
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.username),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    child: Image.network(
              user.photoUrl,
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
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Home2())),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text("Search"),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchPage())),
          ),
          ListTile(
              leading: const Icon(Icons.add_circle),
              title: const Text("Post"),
              onTap: () {
                if (user.role == "admin") {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const PostAdd()));
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                            title: const Text("Access only for club adimins"),
                            children: [
                              SimpleDialogOption(
                                padding: const EdgeInsets.all(20),
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ]);
                      });
                }
              }),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Profile"),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    AdAcc(uid: FirebaseAuth.instance.currentUser!.uid))),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async {
              await AuthMethods().signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage2()));
            },
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage2(),
      ),
    );
  }
}
