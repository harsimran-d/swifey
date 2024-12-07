import 'dart:math';

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.disabled,
  });
  final String buttonText;
  final VoidCallback onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      child: Ink(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xFFE8E9ED),
            gradient: disabled
                ? null
                : const LinearGradient(
                    transform: GradientRotation(pi * -0.2),
                    colors: [
                      Color(0xFFFC654A),
                      Color(0xFFFA2370),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )),
        child: InkWell(
          onTap: disabled ? null : onPressed,
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(
              color: disabled ? const Color(0xFF80848F) : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
