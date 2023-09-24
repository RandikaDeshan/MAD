import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nbook/components/auth_methods.dart';
import 'package:nbook/components/utill.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userController = TextEditingController();
  final _roleController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    _roleController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _userController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {}
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
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: AssetImage("assets/User.jpg"),
                          ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo)))
                  ],
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
                  height: 15.0,
                ),
                TextField(
                  controller: _userController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      filled: true,
                      hintText: "Username",
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
                  onPressed: signUpUser,
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
                            child: CircularProgressIndicator(),
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
