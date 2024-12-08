import 'package:flutter/widgets.dart';

class NameTag extends StatelessWidget {
  const NameTag({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Karan, 29",
      style: TextStyle(
        fontSize: 28,
      ),
    );
  }
}
