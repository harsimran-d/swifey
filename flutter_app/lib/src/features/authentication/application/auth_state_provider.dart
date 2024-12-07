import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthStateNotifier extends StateNotifier<bool> {
  AuthStateNotifier() : super(false);
  void login() {
    state = true;
  }

  void logout() {
    state = false;
    print("logged out");
  }
}

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, bool>((Ref ref) {
  return AuthStateNotifier();
});
