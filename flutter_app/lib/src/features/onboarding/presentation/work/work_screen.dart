import 'package:flutter/material.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/onboarding/presentation/education/education_screen.dart';

import '../top_progress_bar.dart';

class WorkScreen extends StatelessWidget {
  static MaterialPageRoute screen() =>
      MaterialPageRoute(builder: (context) => WorkScreen());
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopProgressBar(steps: 5),
        Row(children: [
          BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(EducationScreen.screen());
            },
            child: Text(
              "Skip",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 30,
          )
        ]),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What do you do?",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Where do you work?",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Job Title",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  keyboardType: TextInputType.name,
                  onEditingComplete: () {},
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Company Name",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  keyboardType: TextInputType.name,
                  onEditingComplete: () {},
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 20,
                ),
                Spacer(),
                PrimaryButton(
                  buttonText: "Next",
                  onPressed: () {
                    Navigator.of(context).push(EducationScreen.screen());
                  },
                  disabled: false,
                ),
              ],
            ),
          ),
        )
      ],
    )));
  }
}
