import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final String photoUrl;
  String? role;

  User({
    required this.email,
    required this.uid,
    required this.username,
    required this.photoUrl,
    this.role,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "role": role,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        email: snapshot['email'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        photoUrl: snapshot['photoUrl'],
        role: snapshot['role']);
  }
}
