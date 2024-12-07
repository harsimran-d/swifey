import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';

import '../email/email_notifier_provider.dart';
import 'otp_input_field.dart';
import 'otp_notifier_provider.dart';

class VerifyEmailOtpScreen extends ConsumerWidget {
  const VerifyEmailOtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hiddenEmail = ref.watch(hiddenEmailProvider);
    final disabled = ref.watch(isOTPCompletedProvider);
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
                  "My email code",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      text: "Sent to $hiddenEmail",
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "  Resend",
                          style: const TextStyle(
                            color: Color(0xFF2F71BA),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: "Don't have access to this email?  ",
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "Update",
                          style: const TextStyle(
                            color: Color(0xFFB43625),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                const OtpInputField(),
                const Spacer(),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: PrimaryButton(
                      disabled: disabled,
                      buttonText: "Next",
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
