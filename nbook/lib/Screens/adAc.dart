import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nbook/Tab/navhome.dart';
import 'package:nbook/components/upload.dart';

class AdAcc extends StatefulWidget {
  final String uid;

  const AdAcc({Key? key, required this.uid}) : super(key: key);

  @override
  State<AdAcc> createState() => _AdAccState();
}

class _AdAccState extends State<AdAcc> {
  var userData = {};
  int postLen = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      postLen = postSnap.docs.length;
      userData = userSnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(context as String, e.toString() as BuildContext);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            drawer: const NavBar(),
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text(userData['username']),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.account_circle))
              ],
            ),
            body: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(userData['photoUrl']),
                  radius: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(userData['username']),
                ),
                Center(
                  child: Text(userData['email']),
                ),
                const Divider(),
                FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('posts')
                        .where('uid', isEqualTo: widget.uid)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                          shrinkWrap: true,
                          itemCount: (snapshot.data! as dynamic).docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 1.5,
                                  childAspectRatio: 1),
                          itemBuilder: (context, index) {
                            DocumentSnapshot snap =
                                (snapshot.data! as dynamic).docs[index];

                            return Container(
                              child: Image(
                                image: NetworkImage(snap['postUrl']),
                                fit: BoxFit.cover,
                              ),
                            );
                          });
                    })
              ],
            ),
          );
  }
}
