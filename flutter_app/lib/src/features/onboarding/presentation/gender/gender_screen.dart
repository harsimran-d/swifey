import 'package:flutter/material.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/onboarding/presentation/interest/interest_screen.dart';

import '../top_progress_bar.dart';

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    child: Ink(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: InkWell(
                        child: Center(
                            child: Text(
                          "Woman",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    child: Ink(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: InkWell(
                        child: Center(
                          child: Text("Man",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: PrimaryButton(
                  buttonText: "Next",
                  onPressed: () {
                    Navigator.of(context).push(InterestScreen.screen());
                  },
                  disabled: false,
                ),
              )
            ],
          )),
        ],
      )),
    );
  }
}
