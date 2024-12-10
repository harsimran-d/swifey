import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/onboarding/presentation/interest/interest_screen.dart';

import '../top_progress_bar.dart';
import 'gender_controller.dart';
import 'gender_options.dart';

class GenderScreen extends StatelessWidget {
  static MaterialPageRoute screen() =>
      MaterialPageRoute(builder: (context) => GenderScreen());
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopProgressBar(steps: 3),
          Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
          Expanded(
              child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "What's your gender?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ))),
              SizedBox(
                height: 20,
              ),
              GenderOptions(),
            ],
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final gender = ref.watch(genderControllerProvider);
                return PrimaryButton(
                  buttonText: "Next",
                  onPressed: () {
                    Navigator.of(context).push(InterestScreen.screen());
                  },
                  disabled: gender.isEmpty,
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
