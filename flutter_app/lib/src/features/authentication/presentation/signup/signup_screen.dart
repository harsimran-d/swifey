import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';

import '../email_controller.dart';
import '../otp/verify_email_otp_screen.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

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
                const Text(
                  "Don't lose access to your account, verify \nyour email.",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                TextField(
                  focusNode: FocusNode()..requestFocus(),
                  onChanged: (value) {
                    ref
                        .read(emailControllerProvider.notifier)
                        .updateEmail(value);
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
                            verificationType: VerifyOtpType.signup,
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
