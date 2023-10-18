import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon icon;

  const TextFieldCustom(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 244, 245),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black87),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
