import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/authentication/presentation/auth_controller.dart';
import 'package:swifey/src/router/router.dart';

import '../email_controller.dart';
import 'otp_input_field.dart';
import 'otp_notifier_provider.dart';

enum VerifyOtpType { signup, signin }

class VerifyEmailOtpScreen extends ConsumerStatefulWidget {
  const VerifyEmailOtpScreen({
    required this.verificationType,
    super.key,
  });
  final VerifyOtpType verificationType;

  @override
  ConsumerState<VerifyEmailOtpScreen> createState() =>
      VerifyEmailOtpScreenState();
}

class VerifyEmailOtpScreenState extends ConsumerState<VerifyEmailOtpScreen> {
  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    _gestureRecognizer.onTap = () {
      final navigator = Navigator.of(context);
      Future.delayed(Duration(seconds: 1), () {
        if (context.mounted) {
          navigator.pop();
        }
      });
      showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (innercontext) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Icon(
                      Icons.sms_outlined,
                      color: Colors.red,
                      size: 40,
                    ),
                    const Text(
                      'Another OTP on its way',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    };
  }

  @override
  void dispose() {
    _gestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          recognizer: _gestureRecognizer,
                          text: "  Resend",
                          style: const TextStyle(
                            color: Color(0xFF2F71BA),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (widget.verificationType == VerifyOtpType.signup)
                  RichText(
                    text: TextSpan(
                        text: "Don't have access to this email?  ",
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pop();
                              },
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
                      buttonText:
                          widget.verificationType == VerifyOtpType.signup
                              ? "Confirm email"
                              : "Sign In",
                      onPressed: () {
                        if (widget.verificationType == VerifyOtpType.signup) {
                          context.goNamed(AppRoutes.onboarding.name);

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Center(
                                          child: Transform.scale(
                                            scale: 2,
                                            child:
                                                const CircularProgressIndicator
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
                        } else {
                          ref.read(authControllerProvider.notifier).login();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            )),
      ),
    );
  }
}
