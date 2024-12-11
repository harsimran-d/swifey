import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';

import '../email_controller.dart';
import '../otp/verify_email_otp_screen.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SigninScreenState();
  }
}

class SigninScreenState extends ConsumerState<SigninScreen> {
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
            onPressed: () {
              _focusNode.unfocus();
              context.pop();
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const VerifyEmailOtpScreen(
                              verificationType: VerifyOtpType.signin,
                            );
                          },
                        ));
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
