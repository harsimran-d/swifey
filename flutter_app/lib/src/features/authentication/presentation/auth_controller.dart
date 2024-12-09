import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swifey/src/features/authentication/data/auth_repo.dart';
import 'package:swifey/src/features/authentication/domain/app_user.dart';

class AuthController extends Notifier<AppUser?> {
  AuthController();
  @override
  AppUser? build() {
    return ref.watch(authRepoProvider);
  }

  Future<void> signup() async {
    await Future.delayed(const Duration(milliseconds: 900));
    await ref.read(authRepoProvider.notifier).signInWithFakeUser();
    ref.invalidateSelf();
  }

  Future<void> login() async {
    await Future.delayed(const Duration(milliseconds: 900));
    await ref.read(authRepoProvider.notifier).signInWithFakeUser();
    ref.invalidateSelf();
  }

  Future<void> logout() async {
    await ref.read(authRepoProvider.notifier).signOut();
    ref.invalidateSelf();
  }
}

final authControllerProvider = NotifierProvider<AuthController, AppUser?>(() {
  return AuthController();
});
