import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/application/auth_state_provider.dart';
import 'package:swifey/src/router/router.dart';

class AuthController extends AsyncNotifier<bool> {
  AuthController();

  Future<void> login() async {
    await Future.delayed(const Duration(milliseconds: 900));
    ref.read(authStateProvider.notifier).login();

    ref.read(goRouterProvider).goNamed(AppRoutes.home.name);
  }

  Future<void> logout() async {
    ref.read(authStateProvider.notifier).logout();
  }

  @override
  bool build() {
    return true;
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, bool>(() {
  return AuthController();
});
