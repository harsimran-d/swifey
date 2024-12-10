import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    hide Options;
import 'package:swifey/src/features/authentication/presentation/email_controller.dart';
import 'package:swifey/src/features/onboarding/presentation/birthday/birthday_controller.dart';
import 'package:swifey/src/features/onboarding/presentation/gender/gender_controller.dart';
import 'package:swifey/src/features/onboarding/presentation/interest/interest_controller.dart';
import 'package:swifey/src/features/onboarding/presentation/name/name_controller.dart';

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

  Future<void> loginWithLocalUser() async {
    final email = ref.read(emailControllerProvider);

    final gender = ref.read(genderControllerProvider);
    final interest = ref.read(interestControllerProvider);
    final birtday = ref.read(birthdayControllerProvider);

    final user = AppUser(
      id: "1",
      name: "Dummy",
      email: email,
      token: "",
      gender: gender,
      interest: interest,
      birthday: birtday,
    );
    await saveUser(user);
    state = user;
    print(user.toString());
    ref.invalidate(emailControllerProvider);
    ref.invalidate(nameControllerProvider);
    ref.invalidate(birthdayControllerProvider);
    ref.invalidate(genderControllerProvider);
    ref.invalidate(interestControllerProvider);
  }

  Future<void> signUpWithLocalUser() async {
    final email = ref.read(emailControllerProvider);
    final name = ref.read(nameControllerProvider);
    final gender = ref.read(genderControllerProvider);
    final interest = ref.read(interestControllerProvider);
    final birtday = ref.read(birthdayControllerProvider);

    final user = AppUser(
      id: "1",
      name: name,
      email: email,
      token: "",
      gender: gender,
      interest: interest,
      birthday: birtday,
    );
    await saveUser(user);
    state = user;
    print(user.toString());
    ref.invalidate(emailControllerProvider);
    ref.invalidate(nameControllerProvider);
    ref.invalidate(birthdayControllerProvider);
    ref.invalidate(genderControllerProvider);
    ref.invalidate(interestControllerProvider);
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
