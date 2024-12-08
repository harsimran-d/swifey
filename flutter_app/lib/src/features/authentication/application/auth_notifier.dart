import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/auth_repo.dart';

class AuthNotifier extends ChangeNotifier {
  final AuthRepo authRepo;

  AuthNotifier(this.authRepo) {
    authRepo.authStateChanges().listen((user) {
      notifyListeners();
    });
  }

  bool get isAuthenticated => authRepo.currentUser != null;
}

final authNotifierProvider = ChangeNotifierProvider((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthNotifier(authRepo);
});
