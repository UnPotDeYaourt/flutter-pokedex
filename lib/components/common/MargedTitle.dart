import 'package:flutter/material.dart';

class MargedTitle extends StatelessWidget {
  const MargedTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),
      ),
    );
  }
}