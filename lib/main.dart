import 'package:flutter/material.dart';
import 'package:shoes/ui/MainPage.dart';
import 'package:shoes/ui/auth/Login.dart';
import 'package:shoes/ui/pages/List.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: Login(),
    );
  }
}
