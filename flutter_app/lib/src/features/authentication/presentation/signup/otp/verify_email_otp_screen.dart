import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/authentication/presentation/signup/auth_controller.dart';

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
                      buttonText: "Confirm email",
                      onPressed: () {
                        ref.read(authControllerProvider.notifier).login();
                        showDialog(
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
                                          child: const CircularProgressIndicator
                                              .adaptive(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text("Logging in"),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
