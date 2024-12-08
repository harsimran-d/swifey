import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState extends StateNotifier<bool> {
  AuthState() : super(false);
  void login() {
    state = true;
  }

  void logout() {
    state = false;
  }
}

final authStateProvider = StateNotifierProvider<AuthState, bool>((Ref ref) {
  return AuthState();
});
