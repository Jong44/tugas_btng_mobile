import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordFieldCustom extends StatelessWidget {
  const PasswordFieldCustom(
      {super.key,
      required this.hidden,
      required this.hintText,
      required this.controller,
      required this.iconButton});

  final bool hidden;
  final String hintText;
  final TextEditingController controller;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 243, 244, 245),
            borderRadius: BorderRadius.circular(15)),
        child: TextField(
            obscureText: hidden,
            controller: controller,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon: iconButton,
            )));
    ;
  }
}
