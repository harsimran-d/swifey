import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  const SubHeading(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18),
    );
  }
}
