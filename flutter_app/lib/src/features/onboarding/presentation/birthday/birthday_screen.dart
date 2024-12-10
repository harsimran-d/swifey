import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/onboarding/presentation/birthday/birthday_controller.dart';
import 'package:swifey/src/features/onboarding/presentation/top_progress_bar.dart';

import '../gender/gender_screen.dart';

class BirthdayScreen extends StatelessWidget {
  static MaterialPageRoute screen() =>
      MaterialPageRoute(builder: (context) => BirthdayScreen());
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopProgressBar(steps: 2),
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
                            "Your b-day?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ))),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Transform.scale(
                          scale: 1.3,
                          child: Consumer(builder: (context, ref, _) {
                            final date = ref.read(birthdayControllerProvider);
                            return CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              maximumYear: DateTime.now().year - 18,
                              minimumYear: 1900,
                              initialDateTime: date,
                              onDateTimeChanged: (dateTime) {
                                ref
                                    .read(birthdayControllerProvider.notifier)
                                    .updateBirthday(dateTime);
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: PrimaryButton(
                        buttonText: "Next",
                        onPressed: () {
                          Navigator.of(context).push(GenderScreen.screen());
                        },
                        disabled: false),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
