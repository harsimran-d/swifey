import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.buttonText,
    required this.callback,
    super.key,
  });
  final String buttonText;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      child: Ink(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          onTap: callback,
          child: Center(
              child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
