import 'package:flutter/widgets.dart';

class NameTag extends StatelessWidget {
  const NameTag({required this.name, required this.age, super.key});
  final String name;
  final String age;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$name, $age",
      style: TextStyle(
        fontSize: 28,
      ),
    );
  }
}
