import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
