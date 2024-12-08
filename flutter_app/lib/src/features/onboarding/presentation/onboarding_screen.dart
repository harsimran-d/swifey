import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';
import 'package:swifey/src/features/authentication/presentation/signup/auth_controller.dart';
import 'package:swifey/src/features/onboarding/presentation/create_profile_screen.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              iconSize: 32,
              icon: const Icon(Icons.cancel_outlined),
              onPressed: () {
                ref.read(authControllerProvider.notifier).logout();
              },
            ),
            const Center(
              child: Text(
                "Terms and Conditions",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(
                buttonText: "I Agree",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateProfileScreen()));
                },
                disabled: false)
          ],
        ),
      ),
    ));
  }
}
