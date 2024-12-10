import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/onboarding/presentation/work/work_screen.dart';

import '../top_progress_bar.dart';
import 'interest_controller.dart';
import 'interest_options.dart';

class InterestScreen extends StatelessWidget {
  static MaterialPageRoute screen() =>
      MaterialPageRoute(builder: (context) => InterestScreen());
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopProgressBar(steps: 4),
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
                        "Who are you \n intersted in seeing?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ))),
              SizedBox(
                height: 20,
              ),
              InterestOptions(),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final interest = ref.watch(interestControllerProvider);
                    return PrimaryButton(
                      buttonText: "Next",
                      onPressed: () {
                        Navigator.of(context).push(WorkScreen.screen());
                      },
                      disabled: interest.isEmpty,
                    );
                  },
                ),
              )
            ],
          )),
        ],
      )),
    );
  }
}
