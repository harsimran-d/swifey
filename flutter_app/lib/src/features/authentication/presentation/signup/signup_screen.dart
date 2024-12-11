import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';

import '../email_controller.dart';
import '../otp/verify_email_otp_screen.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SignupScreenState();
  }
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final disabled = !ref.watch(isValidEmailProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              _focusNode.unfocus();

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
                  focusNode: _focusNode,
                  keyboardType: TextInputType.emailAddress,
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
                        FocusScope.of(context).unfocus();
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
