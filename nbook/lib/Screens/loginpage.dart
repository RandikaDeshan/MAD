import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nbook/Screens/home2.dart';
import 'package:nbook/components/auth_methods.dart';
import 'package:nbook/components/utill.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == "Success") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home2()));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                    filled: true,
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.green),
                    prefixIcon: Icon(
                      Icons.email,
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
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: true,
                  decoration: const InputDecoration(
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
                  onPressed: loginUser,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 2, 103, 25),
                        borderRadius: BorderRadius.all(
                          Radius.circular(37),
                        )),
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
