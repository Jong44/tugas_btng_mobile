import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes/components/PasswordFieldCustom.dart';
import 'package:shoes/components/TextFieldCustom.dart';
import 'package:shoes/ui/MainPage.dart';
import 'package:shoes/ui/auth/Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidden = true;
  List<dynamic> users = [];
  List<String> message = [
    'User tidak ditemukan',
    'Email kosong',
    'Password kosong'
  ];

  bool isLoading = false;

  Future<void> getUser() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/users.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    setState(() {
      users = jsonData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "Sign in to Continue",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email Address",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldCustom(
                hintText: "Your Email Address",
                controller: emailController,
                icon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PasswordFieldCustom(
                  hidden: hidden,
                  hintText: "Your Password",
                  controller: passwordController,
                  iconButton: IconButton(
                    onPressed: () {
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                    icon: Icon(
                      hidden
                          ? CupertinoIcons.eye_slash_fill
                          : CupertinoIcons.eye_fill,
                      color: Colors.blue,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: isLoading ? 90 : 0),
              duration: Duration(seconds: 1),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(0, isLoading ? 60 : 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    final email = emailController.text;
                    final password = passwordController.text;

                    final isUsers = users
                        .where((item) =>
                            item['email'] == email &&
                            item['password'] == password)
                        .toList();

                    if (isUsers.length == 1) {
                      await Future.delayed(Duration(seconds: 5));
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    } else if (email.isEmpty) {
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message[1])));
                    } else if (password.isEmpty) {
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message[2])));
                    } else if (isUsers.length == 0) {
                      await Future.delayed(Duration(seconds: 3));
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message[0])));
                    }
                  },
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Loading",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CircularProgressIndicator(
                              color: Colors.white,
                            )
                          ],
                        )
                      : Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        )))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register())),
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
