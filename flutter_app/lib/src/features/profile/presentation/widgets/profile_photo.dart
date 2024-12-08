import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 56,
      backgroundColor: Colors.grey,
      foregroundImage: AssetImage("assets/images/boy1.jpg"),
    );
  }
}
