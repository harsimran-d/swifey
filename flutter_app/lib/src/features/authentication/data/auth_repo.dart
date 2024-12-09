import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    hide Options;
import 'package:swifey/src/features/authentication/application/fake_auth_service.dart';

import '../domain/app_user.dart';

class AuthRepo extends Notifier<AppUser?> {
  AuthRepo();

  @override
  AppUser? build() {
    getSignedInUser();
    return null;
  }

  Future<void> deleteUser() async {
    ref.read(_ssProvider).delete(key: 'user');
    state = null;
  }

  Future<void> getSignedInUser() async {
    final userRaw = await ref.read(_ssProvider).read(key: 'user');
    if (userRaw == null) {
      state = null;
    } else {
      try {
        final userDecoded = json.decode(userRaw) as Map<String, dynamic>;
        final user = AppUser.fromJson(userDecoded);
        state = user;
      } catch (e) {
        print("Failed to decode user data: $e");
      }
    }
  }

  Future<void> signInWithFakeUser() async {
    final user = FakeAuthService.fakeAppUser;
    await saveUser(user);
    state = user;
  }

  Future<void> saveUser(AppUser user) async {
    await ref
        .read(_ssProvider)
        .write(key: 'user', value: json.encode(user.toJson()));
  }

  Future<void> signOut() async {
    await deleteUser();
    state = null;
  }
}

final _ssProvider = Provider<FlutterSecureStorage>((Ref ref) {
  return const FlutterSecureStorage();
});

final authRepoProvider = NotifierProvider<AuthRepo, AppUser?>(() {
  return AuthRepo();
});
