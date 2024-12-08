import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/data/auth_repo.dart';
import 'package:swifey/src/router/router.dart';

class AuthController extends AsyncNotifier<bool> {
  AuthController();

  Future<void> signup() async {
    await Future.delayed(const Duration(milliseconds: 900));
    ref.read(goRouterProvider).goNamed(AppRoutes.onboarding.name);
  }

  Future<void> login() async {
    await Future.delayed(const Duration(milliseconds: 900));
    ref.read(authRepoProvider).signInWithFakeUser();
  }

  Future<void> logout() async {
    ref.read(authRepoProvider).signOut();
  }

  @override
  bool build() {
    return true;
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, bool>(() {
  return AuthController();
});
