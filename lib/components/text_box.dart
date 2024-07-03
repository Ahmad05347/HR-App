import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String userName;
  final String text;
  final void Function()? onPressed;

  const MyTextBox(
      {super.key,
      required this.text,
      required this.userName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// username
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userName),

              // edit button
              IconButton(onPressed: onPressed, icon: const Icon(Icons.settings))
            ],
          ),

// text
          Text(text)
        ],
      ),
    );
  }
}
