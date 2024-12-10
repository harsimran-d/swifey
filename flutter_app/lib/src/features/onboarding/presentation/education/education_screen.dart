import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/authentication/presentation/auth_controller.dart';

import '../top_progress_bar.dart';

class EducationScreen extends StatelessWidget {
  static MaterialPageRoute screen() =>
      MaterialPageRoute(builder: (context) => EducationScreen());
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopProgressBar(steps: 6),
        Row(children: [
          BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Spacer(),
          Consumer(
            builder: (context, ref, child) => GestureDetector(
              onTap: () {
                ref.read(authControllerProvider.notifier).signup();
                showCreateProfile(context);
              },
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
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
                  "If studying is \nyour thing?",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Degree",
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
                    hintText: "Enter College Name",
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
                Consumer(
                  builder: (context, ref, _) => PrimaryButton(
                    buttonText: "Create Profile",
                    onPressed: () {
                      ref.read(authControllerProvider.notifier).signup();
                      showCreateProfile(context);
                    },
                    disabled: false,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    )));
  }

  Future<dynamic> showCreateProfile(BuildContext context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Transform.scale(
                      scale: 2,
                      child: const CircularProgressIndicator.adaptive(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Creating Profile"),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
