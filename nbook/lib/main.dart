import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nbook/Screens/login.dart';
import 'package:nbook/components/themeModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer(builder: (context, ThemeModel themeModel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NBook',
            theme: themeModel.isDark ? ThemeData.dark() : ThemeData.light(),
            home: const LoginPage(),
          );
        }));
  }
}
