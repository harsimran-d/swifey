import 'package:flutter/material.dart';

class TopProgressBar extends StatelessWidget {
  const TopProgressBar({required this.steps, super.key});
  final int steps;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 8,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
            ),
            Container(
              height: 8,
              width: constraints.maxWidth * steps / 6,
              color: Colors.red,
            ),
          ],
        );
      }),
    );
  }
}
