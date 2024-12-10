import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/common/widgets/dialogs/alert_dialogs.dart';
import 'package:swifey/src/features/onboarding/presentation/name/name_screen.dart';

import 'welcome/heading.dart';
import 'welcome/sub_heading.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "×",
                  style: TextStyle(fontSize: 44),
                )),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: "Welcome to ",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: "Swifey",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
            ),
            SizedBox(height: 8),
            SubHeading("Please follow the House Rules"),
            SizedBox(height: 20),
            Heading("Be yourself."),
            SizedBox(height: 8),
            SubHeading(
                "Make sure your photos, age, and bio are true to who you are."),
            SizedBox(height: 20),
            Heading("Stay safe"),
            SizedBox(height: 8),
            RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    text:
                        "Don't be too quick to give out personal information. ",
                    children: [
                  TextSpan(
                      text: "Date Safely",
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showNotImplementedAlertDialog(context: context);
                        })
                ])),
            SizedBox(height: 20),
            Heading("Play it cool."),
            SizedBox(height: 8),
            SubHeading(
                "Respect others and treat them as you would like to be treated."),
            SizedBox(height: 20),
            Heading("Be proactive."),
            SizedBox(height: 8),
            SubHeading("Always report bad behavior."),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: PrimaryButton(
                buttonText: "I Agree",
                onPressed: () {
                  Navigator.of(context).push(NameScreen.screen());
                },
                disabled: false,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }
}
