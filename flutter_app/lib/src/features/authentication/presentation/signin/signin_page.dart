import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  static MaterialPageRoute<void> get route =>
      MaterialPageRoute(builder: (context) => const SigninPage());
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Sign In"),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
