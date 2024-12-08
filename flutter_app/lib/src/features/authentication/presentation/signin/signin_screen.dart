import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';

import '../email_notifier_provider.dart';
import '../otp/verify_email_otp_screen.dart';

class SigninScreen extends ConsumerWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disabled = !ref.watch(isValidEmailProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your email?",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                TextField(
                  onChanged: (value) {
                    ref.read(emailNotifierProvider.notifier).updateEmail(value);
                  },
                ),
                const Spacer(),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: PrimaryButton(
                      disabled: disabled,
                      buttonText: "Next",
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const VerifyEmailOtpScreen(
                            verificationType: VerifyOtpType.signin,
                          );
                        }));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    );
  }
}
