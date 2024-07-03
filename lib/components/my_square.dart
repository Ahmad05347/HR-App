import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  const MySquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 100,
        width: 200,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blueGrey,
                width: 100,
                height: 200,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blueGrey,
                width: 100,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
