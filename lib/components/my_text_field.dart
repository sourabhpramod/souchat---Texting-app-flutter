// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obsecure;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const MyTextfield(
      {super.key,
      required this.hintText,
      required this.obsecure,
      required this.controller,
      this.focusNode});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        obscureText: obsecure,
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 50, 48, 48),
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
