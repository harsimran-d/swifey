import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/application/auth_state_provider.dart';

import 'home_screen.dart';
import 'landing_screen.dart';

class HomeOrLanding extends ConsumerWidget {
  const HomeOrLanding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedIn = ref.watch(authStateProvider);
    if (loggedIn) {
      return const HomeScreen();
    } else {
      return const LandingScreen();
    }
  }
}
