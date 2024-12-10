import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/onboarding/presentation/birthday/birthday_screen.dart';

import '../top_progress_bar.dart';
import 'lets_go_dialog.dart';
import 'name_controller.dart';

class NameScreen extends StatelessWidget {
  static MaterialPageRoute screen() =>
      MaterialPageRoute(builder: (context) => NameScreen());
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopProgressBar(steps: 1),
        Align(
            alignment: Alignment.centerLeft,
            child: BackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What's your \nfirst name?",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer(builder: (context, ref, child) {
                  return TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter first name",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      ref
                          .read(nameControllerProvider.notifier)
                          .updateName(value);
                    },
                  );
                }),
                SizedBox(
                  height: 12,
                ),
                Text("This is how it'll appear on your profile."),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Can't change it later.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Consumer(builder: (context, ref, _) {
                  if (ref.watch(nameControllerProvider).length > 1) {
                    return PrimaryButton(
                      buttonText: "Next",
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        final goAhead = await showDialog<bool>(
                            context: context,
                            builder: (context) => LetsGoDialog());
                        if (goAhead != null && goAhead) {
                          navigator.push(BirthdayScreen.screen());
                        }
                      },
                      disabled: false,
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        )
      ],
    )));
  }
}
