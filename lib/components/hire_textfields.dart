import 'package:flutter/material.dart';

class HireTextFields extends StatelessWidget {
  final controller;
  final hintText;

  const HireTextFields(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade900),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade900),
                borderRadius: BorderRadius.circular(16),
              ),
              fillColor: Colors.grey.shade300,
              filled: true),
        ),
      ),
    );
  }
}
