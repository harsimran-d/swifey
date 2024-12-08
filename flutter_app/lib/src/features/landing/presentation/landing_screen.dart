import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/router/router.dart';

import 'custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFFFC654A),
            Color(0xFFFA2370),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Swifey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 56,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    buttonText: "Create account",
                    callback: () => context.goNamed(AppRoutes.signup.name),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomButton(
                    buttonText: "Sign in",
                    callback: () => context.goNamed(AppRoutes.signin.name),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
