import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final TextStyle? style;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: style ?? const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink.shade100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink.shade200),
            ),
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
