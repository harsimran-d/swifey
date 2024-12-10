import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/data/auth_repo.dart';

class AuthController extends Notifier<void> {
  AuthController();
  @override
  void build() {
    return;
  }

  Future<void> signup() async {
    await Future.delayed(const Duration(milliseconds: 900));
    await ref.read(authRepoProvider.notifier).signInWithFakeUser();
  }

  Future<void> login() async {
    await Future.delayed(const Duration(milliseconds: 900));
    await ref.read(authRepoProvider.notifier).signInWithFakeUser();
  }

  Future<void> logout() async {
    await ref.read(authRepoProvider.notifier).signOut();
  }
}

final authControllerProvider = NotifierProvider<AuthController, void>(() {
  return AuthController();
});
