import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';

class LetsGoDialog extends StatelessWidget {
  const LetsGoDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 800,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "✋",
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Welcome, Name!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "There's a lot to discover out there. But\n let's get your profile set up first.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: PrimaryButton(
                buttonText: "Let's go",
                onPressed: () {
                  context.pop(true);
                },
                disabled: false,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text(
                "Edit name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
