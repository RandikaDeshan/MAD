// login page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nbook/Screens/home2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 127, 226, 132),
                Color.fromARGB(255, 176, 234, 185),
                Color.fromARGB(255, 241, 253, 244)
              ]),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Image(
                  image: AssetImage("assets/NSBM2.png"),
                  height: 200,
                ),
                const Text(
                  "Welcome to NSBM social media platform",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black54),
                ),
                const Text(
                  "NBook",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                    filled: true,
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.green),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.green,
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(37)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      filled: true,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.green),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(37)),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 2, 103, 25),
                          borderRadius: BorderRadius.all(
                            Radius.circular(37),
                          )),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home2()));
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}