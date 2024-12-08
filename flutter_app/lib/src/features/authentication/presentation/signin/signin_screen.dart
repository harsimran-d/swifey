import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/router/router.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.goNamed(AppRoutes.landing.name);
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
